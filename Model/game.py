from abc import ABCMeta
from datetime import datetime
from Model.domainobject import DomainObject
from Model.domainexception import DomainException

class Game(DomainObject):

	__metaclass__ = ABCMeta

	_name = "Unnamed Game"		# public name of the game 
	_creator = None 			# user who created the game
	_time = None
	_start_time = None
	_end_time = None

	def __init__(self, id_=None):
		super(Game, self).__init__(id_)

	def __str__(self):
		return str(self.getId()) + " Name " + ": " + self._name + "  created by {" + str(self._creator) + "}"

	def getName(self):
		return self._name

	def getCreator(self):
		return self._creator

	def getTime(self):
		return self._time

	def getStartTime(self):
		return self._start_time

	def getEndTime(self):
		return self._end_time

	def setName(self, name):
		if len(name) > 255:
			raise DomainException("The name of a game cannot be more than 255 characters")

		self._name = name

	def setCreator(self, creator):
		from Model.user import User

		if not isinstance(creator, User):
			raise DomainException("Creator must be an instance of the User object not a %s" % str(type(creator)))

		self._creator = creator

	def setTime(self, time):
		if type(time) is not datetime:
			raise DomainException("Time attribute must be a datetime object not a %s" % str(type(time)))

		self._time = time

	def setStartTime(self, time):
		if type(time) is not datetime and time is not None:
			raise DomainException("The start time must be either empty or a datetime object not %s" % str(type(time)))

		self._start_time = time

	def setEndTime(self, time):
		if type(time) is not datetime and time is not None:
			raise DomainException("The end time must be either empty or a datetime object not %s" % str(type(time)))

		self._end_time = time

	def isStarted(self):
		if self.getStartTime() > datetime.now():
			self.started = True
		else:
			self.started = False

		return self.started

	def dict(self):
		self.isStarted()