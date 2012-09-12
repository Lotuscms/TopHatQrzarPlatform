from abc import ABCMeta, abstractmethod
from Model.Mapper.objectwatcher import ObjectWatcher as OW
from Model.domainexception import DomainException

class DomainObject(object):
	"""Abstract base class for any object that is compatible with the Mapper for storage in the persistent storage"""
	__metaclass__ = ABCMeta

	_id = -1							# setup deafult id outside db storage range

	def __init__(self, id_=None):
		# check valid id value (pos int)
		if id_ is not None:
			self.setId(id_)
		else:
			self.__markNew()			# when the object is created without an id it is marked new / for insertion into persistent storage

		self.__markClean()				# during setup we have updated some of the attributes, make sure we don't update DB without any changes

	def __setattr__(self, attr, value):
		"""Whenever an attribute of this object is changed the object is marked dirty and needs to be updated in persistent storage"""
		if attr in self.__dict__:							# check the attr exists
			prevValue = self.__dict__[attr]					# if so set the prevValue to its value
		else:
			prevValue = None

		self.__dict__[attr] = value

		if prevValue != value: 			# when any attribute is changed the object is marked for update
			self.__markDirty()

	def __str__(self):
		return str(self.__class__) + str(self._id)

	# Getters and Setters #
	def getId(self):
		return self._id

	def setId(self, value):
		try:
			value = int(value)
		except ValueError:
			raise DomainException("The id must be an integer")

		if value < 0:
			raise DomainException("The id must be greater than one")

		self._id = value

	def dict(self):
		pass

	# Object Watcher Functions #
	def __markDirty(self):
		ow = OW()
		ow.addDirty(self)

	def __markNew(self):
		ow = OW()
		ow.addNew(self)

	def __markDelete(self):
		ow = OW()
		ow.addDelete(self)

	def __markClean(self):
		ow = OW()
		ow.addClean(self)

	def markClean(self):
		self.__markClean()

	def mapper(self):
		"""Returns the mapper object that this class should use to map this object to storage"""
		mapperName = str(self.__class__.__name__) + "Mapper"
		moduleName = mapperName.lower()

		mapperModule = __import__("Model.Mapper." + moduleName, fromlist=[mapperName])				# import the class

		try:
			instance = getattr(mapperModule, mapperName)()
			return instance
		except AttributeError:
			# now that we have checked all the items in the mapperModule
			raise AttributeError("Unable to create an instance of the mapper class " + mapperName)