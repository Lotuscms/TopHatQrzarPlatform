from ABCMeta import abc
from Model.player import Player
from Model.domainexception import DomainException

class TeamlessPlayer(Player):

	__metaclass__ = ABCMeta

	_game = None

	def __init__(self, id_):
		super(TeamlessPlayer, self).__init__(id_)

	def setGame(self, game_):
		if game_ is not None:
			if not isinstance(game_, Game):
				raise DomainException("Game attribute must be a reference to another Game object")

			self._game = game_

	def getGame(self):
		return self._game