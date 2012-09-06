from playerteammapper import PlayerTeamMapper
from usermapper import UserMapper
from teammapper import TeamMapper
from deferredcollection import DeferredCollection

class QRzarPlayerMapper(PlayerTeamMapper):

	def __init__(self):
		super(QRzarPlayerMapper, self).__init__()

	def targetClass(self):
		return "QRzarPlayer"

	def tableName(self):
		return "players"

	def _doCreateObject(self, data):
		"""Builds the kill object using the raw data provided from the database"""
		from Model.qrzarplayer import QRzarPlayer
		player = QRzarPlayer(data["id"])

		TM = TeamMapper()
		team = TM.find(data["team_id"])
		player.setTeam(team)

		UM = UserMapper()
		user = UM.find(data["user_id"])
		player.setUser(user)

		player.setName(data["name"])
		player.setLat(data["lat"])
		player.setLon(data["lon"])
		player.setScore(data["score"])
		player.setTime(data["time"])
		player.setAlive(bool(data["alive"]))
		player.setQRCode(data["qrcode"])

		return player

	def _doInsert(self, obj):
		# build query
		# id, name, team_id, user_id, lat, lon, score, time, qrcode, alive
		query = "INSERT INTO players VALUES(NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

		# convert boolean value to int bool
		if obj.getAlive() is True:
			alive = 1
		else:
			alive = 0

		params = (obj.getName(), obj.getTeam().getId(), obj.getUser().getId(), 
					obj.getLat(), obj.getLon(), obj.getScore(), obj.getTime(), obj.getQRCode(), alive)

		# run the query
		cursor = self.db.getCursor()
		rowsAffected = cursor.execute(query, params)

		# get insert id
		id_ = cursor.lastrowid
		obj.setId(id_)

		cursor.close()

		if rowsAffected > 0:
			return True
		else:
			return False

	def _doUpdate(self, obj):
		# build the query
		query = """UPDATE players SET 
					name = %s, team_id = %s, user_id = %s, lat = %s, lon = %s, score = %s, 
					time = %s, alive = %s, qrcode = %s 
					WHERE id = %s LIMIT 1"""

		if obj.getAlive() is True:
			alive = 1
		else:
			alive = 0

		params = (obj.getName(), obj.getTeam().getId(), obj.getUser().getId(), 
				obj.getLat(), obj.getLon(), obj.getScore(), obj.getTime(), alive, obj.getQRCode(), obj.getId())

		# run the query
		cursor = self.db.getCursor()
		rowsAffected = cursor.execute(query, params)
		cursor.close()

		if rowsAffected > 0:
			return True
		else:
			return False

	def getPlayerByQrcode(self, team, qrcode):
		if team is None or qrcode is None:
			return None

		# build the query
		query = "SELECT * FROM players WHERE team_id = %s AND qrcode = %s LIMIT 1"
		print query
		params = (team.getId(), qrcode)

		return self.getOne(query, params)