from Request.request import Request
from Request.requesterrors import NotFound, ServerError, Unauthorised, BadRequest
from Networking.statuscodes import StatusCodes as CODE

from Model.Mapper.teammapper import TeamMapper
from Model.team import Team
import MySQLdb as mdb

# Decorator
from Model.authentication import require_login, require_super_user

class TeamScore(Request):

	''' 
		API Documentation
		Documentation is unavailable at the present time.
	'''

	def __init__(self):
		super(TeamScore, self).__init__()

	@require_login
	def _doGet(self):	
		TM = TeamMapper()
		
		if self.arg is not None and self.arg.isdigit():
			try:
				# Get the team by ID
				team = TM.find(self.arg)

			except mdb.DatabaseError, e:
				raise ServerError("Unable to search the team database (%s: %s)" % e.args[0], e.args[1])

			if team is None:
				raise NotFound("This team does not exist")

			rdata = {
				"score": team.getScore()
			}

			return self._response(rdata, CODE.OK)
				
		else:
			raise BadRequest("Teams must be requested by id")
