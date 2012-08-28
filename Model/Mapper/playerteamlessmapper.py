from abc import ABCMeta
from playermapper import PlayerMapper

class PlayerTeamlessMapper(PlayerMapper):

	__metaclass__ = ABCMeta

	def __init__(self):
		super(PlayerTeamlessMapper, self).__init__()

	def getPlayersInGame(self, game, start=0, number=50):
		# check func params
		if start < 0:
			raise mdb.ProgrammingError("Start point must be a postive int")

		if number > 50:
			raise mdb.ProgrammingError("Cannot select more than 50 rows at once")

		# build the query
		query = "SELECT * FROM players WHERE game_id = %s LIMIT %s, %s"
		params = (game.getId(), start, number)

		return DeferredCollection(self, query, params)