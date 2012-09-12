import MySQLdb as mdb

from teamgamemapper import TeamGameMapper
from deferredcollection import DeferredCollection

class QRzarGameMapper(TeamGameMapper):

	def __init__(self):
		super(QRzarGameMapper, self).__init__()

	def targetClass(self):
		return "QRzarGame"

	def tableName(self):
		return "games"
		
	def _doCreateObject(self, data):
		"""Builds the game object given the draw data returned from the database query"""
		from Model.qrzargame import QRzarGame
		from Model.deferredobject import DeferredObject
		from Model.user import User

		game = QRzarGame(data["id"])

		# get creator User object
		creator = DeferredObject(User(data["creator"]))
		game.setCreator(creator)

		# Build the game type information
		game.setName(data["name"])
		game.setTime(data["time"])
		game.setStartTime(data["start_time"])
		game.setEndTime(data["end_time"])

		return game

	def _doInsert(self, obj):
		# build query
		# id, name, game_type, creator, time, start_time, end_time
		query = "INSERT INTO games VALUES(NULL, %s, %s, NOW(), %s, %s)"

		# convert boolean value to int bool
		params = (obj.getName(), obj.getCreator().getId(), obj.getStartTime(), obj.getEndTime())

		# run the query
		cursor = self.db.getCursor()
		rowsAffected = cursor.execute(query, params)

		# get insert id
		id_ = cursor.lastrowid
		obj.setId(id_)

		cursor.close()

		# only if rows were changed return a success response
		if rowsAffected > 0:
			return True
		else:
			return False

	def _doUpdate(self, obj):
		# build the query
		query = "UPDATE games SET name = %s, creator = %s, start_time = %s, end_time = %s WHERE id = %s LIMIT 1"
		params = (obj.getName(), 1, obj.getStartTime(), obj.getEndTime(), obj.getId())

		# run the query
		cursor = self.db.getCursor()
		rowsAffected = cursor.execute(query, params)
		cursor.close()

		if rowsAffected > 0:
			return True
		else:
			return False