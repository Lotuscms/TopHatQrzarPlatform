from Request.request import Request
from Request.requesterrors import NotFound, ServerError, BadRequest, Forbidden
from Networking.statuscodes import StatusCodes as CODE
from Model.authentication import require_login
from Model.depth import Depth
from Model.Mapper.usermapper import UserMapper
from Model.Mapper.teammapper import TeamMapper
from Model.Mapper.qrzargamemapper import QRzarGameMapper as GameMapper
from Model.qrzargame import QRzarGame
from Model.team import Team
import MySQLdb as mdb

class Teams(Request):

	''' 
		API Documentation
		Documentation for the Core Request of Teams is available from the TopHat wiki at:
		http://wiki.tophat.ie/index.php?title=Core_Requests:_Teams
	'''

	def __init__(self):
		super(Teams, self).__init__()

	@require_login
	def _doGet(self):
		try:
			
			TM = TeamMapper()
			
			if self.arg is not None:
				if self.arg.isdigit():
					# Get the user by ID
					team = TM.find(self.arg)
				else:
					raise BadRequest("Teams must be requested by ID")

				if team is not None:
					return self._response(Depth.build(team, self.depth), CODE.OK)
				else:
					raise NotFound("There is no team identified by the number %s" % self.arg)

		except mdb.DatabaseError, e:
			raise ServerError("Unable to search the game database (%s: %s)" % e.args[0], e.args[1])

	@require_login
	def _doPost(self, dataObject):

		if "name" in dataObject and "game" in dataObject and "respawn_code" in dataObject and "reference_code" in dataObject:	
			TM = TeamMapper()

			team = Team()

			try:
				game = GameMapper().find(dataObject["game"]["id"])

				if game is None:
					raise NotFound("The specified game id was not found on the server.")

				team.setGame(game)
			except mdb.DatabaseError, e:
				raise ServerError("Unable to search the teams or players database (%s)" % e.args[1])

			team.setName(dataObject["name"])
			team.setRespawnCode(dataObject["respawn_code"])
			team.setReferenceCode(dataObject["reference_code"])

			try:
				TM.insert(team)			
			except mdb.DatabaseError, e:
				raise ServerError("Unable to create the team in the database (%s)" % e.args[1])

			return self._response(Depth.build(team, self.depth), CODE.CREATED)
		else:
			raise BadRequest("Required params not sent")
