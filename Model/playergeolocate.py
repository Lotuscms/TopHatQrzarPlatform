from abc import ABCMeta
from Model.player import Player
from Model.domainexception import DomainException

class PlayerGeoLocate(Player):

	__metaclass__ = ABCMeta

	_lat = 0.0
	_lon = 0.0

	def __init__(self, id_=None):
		super(PlayerGeoLocate, self).__init__(id_)

	def setLat(self, lat):
		# type checking required
		if lat is None:
			self._lat = 0.0
		else:
			self._lat = lat

	def setLon(self, lon):
		# type checking required
		if lon is None:
			self._lon = 0.0
		else:
			self._lon = lon

	def getLat(self):

		if self._lat is None:
			return 0.0
		else:
			return self._lat

	def getLon(self):
		if self._lon is None:
			return 0.0
		else:
			return self._lon