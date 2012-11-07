from Request.request import Request
from Request.requesterrors import NotFound, ServerError, BadRequest, Forbidden
from Networking.statuscodes import StatusCodes as CODE
from Model.authentication import require_login
from Model.depth import Depth
from Model.Mapper.usermapper import UserMapper
from Model.Mapper.teammapper import TeamMapper
from Model.qrzargame import QRzarGame
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
