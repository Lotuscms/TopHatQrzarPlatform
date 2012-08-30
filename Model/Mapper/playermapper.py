from abc import ABCMeta
from mapper import Mapp

class PlayerMapper(Mapp):

	__metaclass__ = ABCMeta

	def __init__(self):
		super(PlayerMapper, self).__init__()