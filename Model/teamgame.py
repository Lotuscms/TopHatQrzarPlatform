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