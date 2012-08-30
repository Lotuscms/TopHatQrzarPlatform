from abc import ABCMeta
from Model.player import Player
from Model.domainexception import DomainException

class PlayerGeoLocate(Player):

	__metaclass__ = ABCMeta

	_lat = 0.0
	_lon = 0.0

	def __init__(self, id_):
		super(PlayerGeoLocate, self).__init__(id_)

	def setLat(self, lat):
		# type checking required
		self._lat = lat

	def setLon(self, lon):
		# type checking required
		self._lon = lon

	def getLat(self):
		return self._lat

	def getLon(self):
		return self._lon