from abc import ABCMeta
from Model.player import Player
from Model.domainexception import DomainException

class TeamPlayer(Player):

	__metaclass__ = ABCMeta

	_team = None

	def __init__(self, id_=None):
		super(TeamPlayer, self).__init__(id_)

	def getTeam(self):
		return self._team

	def setTeam(self, team):
		from Model.team import Team

		if not isinstance(team, Team):
			raise DomainException("Team var must reference a team object not a %s" % str(type(team)))

		self._team = team