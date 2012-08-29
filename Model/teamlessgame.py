from abc import ABCMeta
from model.game import Game
from model.domainexception import DomainException

class TeamlessGame(Game):

	__metaclass__ = ABCMeta

	_players = None 		# deferred collection of players

	def __init__(self, id_):
		super(TeamlessGame, self).__init__(id_)

	def getPlayers(self):
		# check have we gotten the list already
		if self._players is None:
			from Model.Mapper.playermapper import PlayerMapper
			PM = PlayerMapper()
			self._players = PM.getPlayersInGame(self)

		return self._players