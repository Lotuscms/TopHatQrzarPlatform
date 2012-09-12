from abc import ABCMeta
from playermapper import PlayerMapper
from deferredcollection import DeferredCollection

class PlayerGeolocateMapper(PlayerMapper):

	__metaclass__ = ABCMeta

	def __init__(self):
		super(PlayerGeolocateMapper, self).__init__()

	def findInDistance(self, player, distance):

		# get rough lat boundaries using rough euclidean algerbra
		from Common.geolocate import findLatBoundaryDistance
		d = findLatBoundaryDistance(distance)
		lat1 = player.getLat() - d
		lat2 = player.getLat() + d

		# search using lat bounaries on the indexed fields
		query = """SELECT *, DISTANCE(lat, lon, %s, %s) AS dist from players 
					WHERE lat BETWEEN %s AND %s HAVING dist < %s ORDER BY dist ASC LIMIT 50"""
		params = (player.getLat(), player.getLon(), player.getLat(), player.getLon(), distance)

		return DeferredCollection(self, query, params)