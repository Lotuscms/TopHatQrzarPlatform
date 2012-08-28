import MySQLdb as mdb
from abc import ABCMeta
from gamemapper import GameMapper
from deferredcollection import DeferredCollection

class TeamlessGameMapper(GameMapper):

	__metaclass__ = ABCMeta

	def __init__(self):
		super(TeamlessGameMapper, self).__init__()

	def findByUser(self, user, start=0, number=50):
		if start < 0:
			raise mdb.ProgrammingError("The start point must be a positive int")

		if number > 50:
			raise mdb.ProgrammingError("You cannot select more than 50 rows at one time")

		query = """SELECT g.*
					FROM games g 
					LEFT JOIN players p ON p.game_id = g.id 
					LEFT JOIN users u ON p.user_id = u.id 
					WHERE u.id = %s LIMIT %s, %s"""
		params = (user.getId(), start, start+number)

		return deferredcollection.DeferredCollection(self, query, params)