import MySQLdb as mdb
from abc import ABCMeta
from gamemapper import GameMapper
from deferredcollection import DeferredCollection

class TeamGameMapper(GameMapper):

	__metaclass__ = ABCMeta

	def __init__(self):
		super(TeamGameMapper, self).__init__()

	def findByUser(self, user, start=0, number=50):
		if start < 0:
			raise mdb.ProgrammingError("The start point must be a positive int")

		if number > 50:
			raise mdb.ProgrammingError("You cannot select more than 50 rows at one time")

		query = """SELECT g.* 
				FROM games g 
				LEFT JOIN teams t ON t.game_id = g.id 
				LEFT JOIN players p ON p.team_id = t.id 
				LEFT JOIN users u ON u.id = p.user_id 
				WHERE u.id = %s LIMIT %s, %s"""
		params = (user.getId(), start, start+number)

		return DeferredCollection(self, query, params)