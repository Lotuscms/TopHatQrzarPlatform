from abc import ABCMeta
from playermapper import PlayerMapper

class PlayerTeamMapper(PlayerMapper):

	__metaclass__ = ABCMeta

	def __init__(self):
		super(PlayerTeamMapper, self).__init__()