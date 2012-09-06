from Request.request import Request
from Request.requesterrors import NotFound, ServerError, BadRequest, Conflict
from Networking.statuscodes import StatusCodes as CODE

from Model.depth import Depth
from Model.kill import Kill
from Model.Mapper.killmapper import KillMapper
from Model.Mapper.qrzargamemapper import QRzarGameMapper
from Model.Mapper.qrzarplayermapper import QRzarPlayerMapper
from Common.utils import parseDateTime
import MySQLdb as mdb
from datetime import datetime

# Decorator
from Model.authentication import require_login

class Kills(Request):

	''' 
		API Documentation
		Documentation for the Core Request of Games is available from the TopHat wiki at:
		http://wiki.tophat.ie/index.php?title=Core_Requests:_Kills
	'''

	def __init__(self):
		super(Kills, self).__init__()

	@require_login
	def _doGet(self):
		try:
			
			KM = KillMapper()
			
			if self.arg is not None:
				if self.arg.isdigit():
					# Get the user by ID
					kill = KM.find(self.arg)
				else:
					raise BadRequest("Kill must be requested by ID")

				if kill is not None:
					return self._response(Depth.build(kill, 0), CODE.OK)
				else:
					raise NotFound("This kill does not exist")
			
			else:
				offset = 0
				kills = KM.findAll(offset, offset+50)

				killslist = []
				for kill in kills:
					killslist.append(Depth.build(kill, 2))

				killdict = {"kills": killslist, "pagination_offset": offset, "max_perpage": 50}

				return self._response(killdict, CODE.OK)

		except mdb.DatabaseError, e:
				raise ServerError("Unable to search the kill database (%s: %s)" % e.args[0], e.args[1])

		return self._response({}, CODE.UNIMPLEMENTED)

	@require_login
	def _doPost(self, dataObject):
		print str(dataObject)
		if "killer" and "victim_qrcode" in dataObject:
			try:
				KM = KillMapper()
				PM = QRzarPlayerMapper()

				if dataObject["killer"] is not None and dataObject["victim_qrcode"] is not None:

					if "id" in dataObject["killer"]:
						# Get the user by ID
						killer = PM.find(dataObject["killer"]["id"])

						if killer is None:
							raise NotFound("Either the victim or the killer were invalid player objects")

						victim = PM.getPlayerByQrcode(killer.getTeam().getGame(), dataObject["victim_qrcode"])

						if victim is None:
							raise NotFound("Either the victim or the killer were invalid player objects")
					else:
						raise BadRequest("Arguments provided for this kill are invalid.")

				else:
					raise BadRequest("Arguments provided for this kill are invalid.")
				print killer.getId(), victim.getId()
				if killer.getId() == victim.getId():
					raise Conflict("You cannot kill yourself, that's a sin!!!!!11111OMGZ")
				if killer.getAlive() is False:
					raise Conflict("You are not alive, therefore you can't tag someone else!")
				if victim.getAlive() is False:
					raise Conflict("Victim is already dead, let him rest!")
				kill = Kill()

				kill.setKiller(killer)
				kill.setVictim(victim)
				kill.setVerified(False)

				# Even though unverified, let's set that user as dead for now
				victim.setAlive(False)
				PM.update(victim)

				kill.setTime(datetime.now())

				KM.insert(kill)
				
				killer.incrementScore()
				PM.update(killer)


				return self._response(Depth.build(kill, 3), CODE.CREATED)
				
			except mdb.DatabaseError, e:
				raise ServerError("Unable to search the user database (%s)" % e.args[1])
		else:
			raise BadRequest("Killer and victim_qrcode were not submitted")

	@require_login
	def _doPut(self, dataObject):
		return self._response({}, CODE.UNIMPLEMENTED)

	@require_login
	def _doDelete(self):
		return self._response({}, CODE.UNIMPLEMENTED)
