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

	def dict(self, depth=0):
		if depth < 0:
			return { "id": seld.getId() }
		else:
			# built a list of player objects from the 
			playerlist = []
			players = self.getPlayers()
			if players:
				for player in players:
					playerlist.append(player.dict(depth-1))

			# get the start of the dictionary from parent defintion
			dict_ = super(TeamlessGame, self).dict(depth-1)

			# append the players info to the rest of the dict
			dict_["players"] = playerslist

			return dict_