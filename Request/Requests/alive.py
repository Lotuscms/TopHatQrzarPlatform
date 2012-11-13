from Request.request import Request
from Request.requesterrors import NotFound, ServerError, Unauthorised, BadRequest
from Networking.statuscodes import StatusCodes as CODE

from Model.Mapper.qrzarplayermapper import QRzarPlayerMapper
from Model.player import Player
from Model.depth import Depth
import MySQLdb as mdb

# Decorator
from Model.authentication import require_login, require_super_user

class Alive(Request):

	''' 
		API Documentation
		Documentation is unavailable at the present time.
	'''

	def __init__(self):
		super(Alive, self).__init__()

	@require_login
	def _doGet(self):	
		PM = QRzarPlayerMapper()
		
		if self.arg is not None and self.arg.isdigit():
			try:
				# Get the player by ID
				player = PM.find(self.arg)

			except mdb.DatabaseError, e:
				raise ServerError("Unable to search the player database (%s: %s)" % e.args[0], e.args[1])

			if player is None:
				raise NotFound("This player does not exist")

			rdata = {
				"alive": player.getAlive(),
				"score": player.getScore(),
				"teamscore": player.getTeam().getScore()
			}

			print str(player.getTeam().dict())

			return self._response(rdata, CODE.OK)
				
		else:
			raise BadRequest("Players must be requested by id")
