from datetime import datetime
from Model.domainobject import DomainObject
from Model.domainexception import DomainException
from Model.Mapper.collection import Collection

class Depth:

	@staticmethod
	def build(obj, depth=0):
		if not isinstance(obj, DomainObject):
			raise DomainException("Depth can only build dictionaries from domain object classes")

		if depth < 0:
			return { "id": obj.getId() }									# on low depth just return the id not the full object

		hide = ["password", "email"]

		obj.dict()	

		# for all the attributes in the object build them out
		dic = {}
		for attr, value in obj.__dict__.items():
			# remove leading _ if it exists
			if attr[:1] == "_":
				attr = attr[1:]

			if attr in hide:
				continue

			# see if value is special circumstance
			if isinstance(value, Collection):								# Collection
				dic[attr] = Depth._buildList(value.list(), depth-1)			# gets a list version of the collection then builds the list's dictionaries

			elif isinstance(value, list):									# List
				dic[attr] = Depth._buildList(value, depth-1)				# builds a list of fleshed out objects not object references

			elif isinstance(value, datetime):								# Datetime object
				dic[attr] = str(value)										# convert timestamp object into string

			elif isinstance(value, DomainObject):							# DomainObject 
				dic[attr] = Depth.build(value, depth-1)						# recursively build reference objects' dictionaries

			else:															# Normal (int, str, long, bool)
				dic[attr] = value

		return dic

	@staticmethod
	def _buildList(list_, depth=0):
		"""Builds a list of built objects dictionaries from a list of references to python objects"""

		built_items = []
		for item in list_:
			built_items.append(Depth.build(item, depth-1))

		return built_items