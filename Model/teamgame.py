from abc import ABCMeta
from Model.game import Game
from Model.domainexception import DomainException

class TeamGame(Game):

	__metaclass__ = ABCMeta
	
	_teams = None

	def __init__(self, id_):
		super(TeamGame, self).__init__(id_)

	def getTeams(self):
		# check have we gotten the list already
		if self.teams is None:
			from Model.Mapper.teammapper import TeamMapper
			TM = TeamMapper()
			self._players = TM.getByGame(self)

		return self._players

	def dict(self, depth=0):
		if depth < 0:
			return { "id": seld.getId() }
		else:
			# built a list of player objects from the 
			teamlist = []
			teams = self.getPlayers()
			if teams:
				for team in teams:
					teamlist.append(team.dict(depth-1))

			# get the start of the dictionary from parent defintion
			dict_ = super(TeamGame, self).dict(depth-1)

			# append the players info to the rest of the dict
			dict_["teams"] = playerslist

			return dict_