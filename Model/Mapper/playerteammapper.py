from abc import ABCMeta
from playermapper import PlayerMapper
from deferredcollection import DeferredCollection

class PlayerTeamMapper(PlayerMapper):

	__metaclass__ = ABCMeta

	def __init__(self):
		super(PlayerTeamMapper, self).__init__()

	def findByTeam(self, team, start=0, number=50):
		if start < 0:
			raise mdb.ProgrammingError("The start point must be a positive int")

		if number > 50:
			raise mdb.ProgrammingError("You cannot select more than 50 rows at one time")

		query = "SELECT * FROM players WHERE team_id = %s LIMIT %s, %s"
		params = (team.getId(), start, start+number)

		return DeferredCollection(self, query, params)