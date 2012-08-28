import MySQLdb as mdb
from abc import ABCMeta
from mapper import Mapp

class GameMapper(Mapp):

	__metaclass__ = ABCMeta

	def __init__(self):
		super(GameMapper, self).__init__()