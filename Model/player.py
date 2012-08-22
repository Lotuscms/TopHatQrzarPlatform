from datetime import datetime
from Model.domainobject import DomainObject
from Model.user import User
from Model.game import Game
from Model.domainexception import DomainException

class Player(DomainObject):

	_name = "Anonymous" 
	_photo = None 
	_game = None	
	_user = None
	_lat = 0.0			
	_lon = 0.0 			
	_score = 0			
	_time = datetime.now()
	_qrcode = None
	_team = None
	_alive = True 		

	def __init__(self, id_=None):
		super(Player, self).__init__(id_)

	def __str__(self):
		return self._name + " (" + self._user.getName() + ") in game " + self._game.getName() + " with a score of " + str(self._score) + " (" + str(self._time) + ")"

	# Setters #
	def setName(self, name):
		if len(name) > 60:
			raise DomainException("Name of player must be less than 60 characters")

		self._name = name

	def setPhoto(self, photo):
		if photo is not None:
			if len(photo) != 32:
				raise DomainException("Photo must be a 32 character string")

		self._photo = photo

	def setGame(self, game_):
		if game_ is not None:
			if not isinstance(game_, Game):
				raise DomainException("Game attribute must be a reference to another Game object")

			self._game = game_

	def setUser(self, user_):
		if not isinstance(user_, User):
			raise DomainException("User attribute must be a reference to another User object")

		self._user = user_

	def setLat(self, lat):
		# type checking required
		self._lat = lat

	def setLon(self, lon):
		# type checking required
		self._lon = lon

	def setScore(self, score):
		try:
			score = int(score)
		except ValueError:
			raise DomainException("Score must be an integer")

		if score > 99999 or score < -99999:
			raise DomainException("Score must be between -99999 and +99999")

		self._score = score

	def setTime(self, time_):
		if time_ is not None:
			if type(time_) is not datetime:
				raise DomainException("Time must a datetime object")

			self._time = time_

	def setAlive(self, alive):
		if not isinstance(alive, bool):
			raise DomainException("Alive attr must be a boolean not a %s" % str(type(alive)))

		self._alive = alive

	def setQRCode(self, code):
		if len(code) not 6:
			raise DomainException("That is not a valid QR Code")

		self._qrcode = code

	# Getters #
	def getName(self):
		return self._name	

	def getPhoto(self):
		return self._photo

	def getGame(self):
		return self._game

	def getUser(self):
		return self._user	

	def getLat(self):
		return self._lat

	def getLon(self):
		return self._lon

	def getScore(self):
		return self._score

	def getTime(self):
		return self._time

	def getAlive(self):
		return self._alive

	def getQRCode(self):
		return self._qrcode

	def getTeam(self):
		return self._qrcode[:1]

	def dict(self, depth=0):
		# Encountered a weird corrupted game item from DB. Better to log this and then return empty set
		if self._game is None:
			return {}

		# User may have been deleted, ensure crash does not occur.
		if self.getUser() is not None:
			if depth < 0:
				return { "id": self.getId() }
			else:
				return {
					"id": self.getId(),
					"name": self.getName(),
					"player_user": self.getUser().dict(depth-1),
					"game": self.getGame().dict(depth-1),
					"longitude": self.getLon(),
					"latitude": self.getLat(),
					"photo": self.getPhoto(),
					"score": self.getScore(),
					"time": str(self.getTime()),
					"qrcode": self.getQRCode(),
					"team": self.getTeam(),
					"alive": self.getAlive()
				}
		else:
			return super(Player, self).dict(depth-1)