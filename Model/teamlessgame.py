from abc import ABCMeta
from model.game import Game
from model.domainexception import DomainException
from model.teamlessplayer import TeamlessPlayer

class TeamlessGame(Game):

	__metaclass__ = ABCMeta

	_players = None 		# deferred collection of players

	def __init__(self, id_=None):
		super(TeamlessGame, self).__init__(id_)

	def getPlayers(self):
		# check have we gotten the list already
		if self._players is None:
			from Model.Mapper.playermapper import PlayerMapper
			PM = PlayerMapper()
			self._players = PM.getPlayersInGame(self)

		return self._players

	def addPlayer(self, player):
		if not isinstance(player, TeamlessPlayer):
			raise DomainException("Can only add TeamlessPlayer objects to the players list on TeamlessGame objects")

		player.setGame(self)

		players = self.getPlayers()
		players.add(player)

	def dict(self):
		self.getPlayers()

		super(TeamlessGame, self).dict()