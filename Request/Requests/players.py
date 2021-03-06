from Request.request import Request
from Request.requesterrors import NotFound, ServerError, Unauthorised, BadRequest, Conflict, Forbidden
from Networking.statuscodes import StatusCodes as CODE

from Model.depth import Depth
from Model.Mapper.teammapper import TeamMapper
from Model.Mapper.qrzarplayermapper import QRzarPlayerMapper
from Model.qrzarplayer import QRzarPlayer
import MySQLdb as mdb

# Decorator
from Model.authentication import require_login, require_super_user

class Players(Request):

	''' 
		API Documentation
		Documentation for the Core Request of Games is available from the TopHat wiki at:
		http://wiki.tophat.ie/index.php?title=Core_Requests:_Players
	'''

	def __init__(self):
		super(Players, self).__init__()

	@require_super_user
	@require_login
	def _doGet(self):
		try:

			PM = QRzarPlayerMapper()

			if self.arg is not None:
				if self.arg.isdigit():
					# Get the user by ID
					player = PM.find(self.arg)
				else:
					raise BadRequest("Players must be requested by ID")

				if player is not None:
					return self._response(Depth.build(player, self.depth), CODE.OK)
				else:
					raise NotFound("This player does not exist")

			else:

				offset = 0
				players = PM.findAll(offset, offset+50)

				if players is None:
					raise NotFound("There are no players on this system.")

				playerslist = []
				for player in playerslist:
					playerslist.append(Depth.build(player, self.depth))

				playerslist = {"players": playerslist, "pagination_offset": offset, "max_perpage": 50}

				return self._response(playerslist, CODE.OK)

		except mdb.DatabaseError, e:
				raise ServerError("Unable to search the player database (%s: %s)" % e.args[0], e.args[1])

	@require_login
	def _doPost(self, dataObject):
		if "name" and "game" and "qrcode" in dataObject:
			if "id" not in dataObject["game"]:
				raise BadRequest("Argument provided for this game type is invalid.")

			reference_code = dataObject["qrcode"][:1]
			qr_code = dataObject["qrcode"]
			try:
				
				team = TeamMapper().findByGameIdAndCode(dataObject["game"]["id"], reference_code)

				if team is None:
					raise NotFound("The specified game id with the QRcode was not found on the server.")

				if QRzarPlayerMapper().getPlayerByQrcode(team.getGame(),qr_code ) is not None:
					raise Conflict("Your QR code is in use in this game: %s." % qr_code)


			except mdb.DatabaseError, e:
				raise ServerError("Unable to search the teams or players database (%s)" % e.args[1])

			if team is None:
				raise NotFound("Unable to find team to add player to. Check your qrcode setup.")

			player = QRzarPlayer()
			player.setName(dataObject["name"])
			player.setQRCode(qr_code)
			player.setUser(self.user)
			player.setLon(0.0)
			player.setLat(0.0)
			team.addPlayer(player)

			QRzarPlayerMapper().insert(player)

			return self._response(Depth.build(player, self.depth), CODE.CREATED)

		else:
			raise BadRequest("Required params name, game and qrcode not sent")

	@require_login
	def _doPut(self, dataObject):

		if  "id" in dataObject:
			try:

				PM = QRzarPlayerMapper()

				if type(dataObject["id"]) is int:
					# Get the user by ID

					player = PM.find(dataObject["id"])

					if player is None:
						raise NotFound("The specified player type does not exist.")
				else:
					raise BadRequest("Argument provided for this player type is invalid.")

				player_user_id= player.getUser().getId()
				authenticated_user_id = self.user.getId()

 				if player_user_id == authenticated_user_id or self.user.accessLevel('super_user'):

					if dataObject.has_key("respawn_code"):

						if dataObject["respawn_code"] == player.getTeam().getRespawnCode() or self.user.accessLevel('super_user'):
							player.setAlive(True)

						else:
							raise Forbidden("Incorrect respawn QRcode")

					if "name" in dataObject:
						player.setName(dataObject["name"])

					if "latitude" in dataObject:
						player.setLat(dataObject["latitude"])

					if "longitude" in dataObject:
						player.setLon(dataObject["longitude"])

					if "flashed" in dataObject and "degree" in dataObject:
							player.setFlashed(dataObject["flashed"], dataObject["degree"])

					PM.update(player)

				return self._response(Depth.build(player, self.depth), CODE.CREATED)

			except mdb.DatabaseError, e:
				raise ServerError("Unable to search the player database (%s)" % e.args[1])
		else:
			raise BadRequest("Required params name, game and photo not sent")

	@require_login
	def _doDelete(self):
		if self.arg is None:
			raise BadRequest("You must provide the ID of the player to be deleted")

		PM = QRzarPlayerMapper()

		# get the user if it exists
		try:
			if self.arg.isdigit():
				# Get the player by ID
				player = PM.find(self.arg)
			else:
				raise BadRequest("Players must be requested by ID")

		except mdb.DatabaseError, e:
			raise ServerError("Unable to search the player database (%s: %s)" % e.args[0], e.args[1])

		if player is None:
				raise NotFound("There is no player identified by the number %s" % self.arg)

		# check user has the priviledges
		if not self.user.getId() == player.getUser().getId() and not self.user.accessLevel('super_user'):
			raise Unauthorised("You do not have sufficient privileges to delete this player.")

		# delete the player from the database
		result = PM.delete(player)

		if result:
			return self._response({"message": "Player Deleted Successfully."}, CODE.OK)
		else:
			raise ServerError("Unable to delete the player")
