from abc import ABCMeta
from datetime import datetime
from Model.domainobject import DomainObject
from Model.user import User
from Model.game import Game
from Model.domainexception import DomainException
from Model.deferredobject import DeferredObject

class Player(DomainObject):

	__metaclass__ = ABCMeta

	_name = "Anonymous" 
	_user = None		
	_score = 0			
	_time = datetime.now()
	_alive = True 		
	_flashed = datetime.now()
	_degree = 0

	def __init__(self, id_=None):
		super(Player, self).__init__(id_)

		self._score = 0
		self._alive = True
		self._time = datetime.now()
		self._flashed = datetime.now()


	# Setters #
	def setName(self, name):
		if len(name) > 60:
			raise DomainException("Name of player must be less than 60 characters")

		self._name = name

	def setUser(self, user_):
		if not isinstance(user_, User) and not isinstance(user_, DeferredObject):
			raise DomainException("User attribute must be a reference to another User object not a %s" % str(type(user_)))

		self._user = user_

	def setScore(self, score):
		try:
			score = int(score)
		except ValueError:
			raise DomainException("Score must be an integer")

		if score > 99999 or score < -99999:
			raise DomainException("Score must be between -99999 and +99999")

		self._score = score
	def setFlashed(self, flashed, degree):
			try:
					flashed = datetime(flashed)
			except ValueError:
					raise DomainException("flashed must a timestamp")

			try:
					degree = int(degree)
			except ValueError:
					raise DomainException("degree must be an integer")

			if degree > 100 or degree < 0:
					raise DomainException("degree must be between 0 and 100")
			self._flashed=flashed
			self._degree = degree



	def getFlashed(self):
			return self._flashed

	def getDegree(self):
			return self._degree
	
	def getScore(self):
		return self._score

	def incrementScore(self):
		self._score +=1

	def decrementScore(self):
		self._score -=1

	def setTime(self, time_):
		if time_ is not None:
			if type(time_) is not datetime:
				raise DomainException("Time must a datetime object")

			self._time = time_

	def setAlive(self, alive):
		if not isinstance(alive, bool):
			raise DomainException("Alive attr must be a boolean not a %s" % str(type(alive)))

		self._alive = alive

	# Getters #
	def getName(self):
		return self._name

	def getUser(self):
		return self._user	

	def getTime(self):
		return self._time

	def getAlive(self):
		return self._alive
