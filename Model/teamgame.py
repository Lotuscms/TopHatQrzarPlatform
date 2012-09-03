from abc import ABCMeta
from Model.game import Game
from Model.domainexception import DomainException
from Model.team import Team

class TeamGame(Game):

	__metaclass__ = ABCMeta
	
	_teams = None

	def __init__(self, id_=None):
		super(TeamGame, self).__init__(id_)

	def getTeams(self):
		# check have we gotten the list already
		if self._teams is None:
			from Model.Mapper.teammapper import TeamMapper
			TM = TeamMapper()
			self._teams = TM.getByGame(self)

		return self._teams

	def addTeam(self, team):
		if not isinstance(team, Team):
			raise DomainException("Only can only add Team objects to the list of teams in this game")

		team.setGame(team)

		teams = self.getTeams()
		teams.add(team)

	def dict(self):
		self.getTeams()		# hit lazy load

		super(TeamGame, self).dict()