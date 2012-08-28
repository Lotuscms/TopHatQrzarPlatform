from Model.teamplayer import TeamPlayer
from Model.playergeolocate import PlayerGeoLocate
from Model.domainexception import DomainException

class QRzarPlayer(TeamPlayer, PlayerGeoLocate):

	_qrcode = None

	def __init__(self, id_):
		super(QRzarPlayer, self).__init__(id_)

	def __str__(self):
		return self._name + " (" + self._user.getName() + ") for team " + self._team.getName() + " in game " + self.getTeam().getGame().getName() + " with a score of " + str(self._score) + " (" + str(self._time) + ")"

	def getQRCode(self):
		return self._qrcode

	def setQRCode(self, code):
		if len(code) is not 6:
			raise DomainException("That is not a valid QR Code, it should be 6 characters long not %i characters long" % len(code))

		self._qrcode = code

	def dict(self, depth=0):
		return super(QRzarPlayer, self).dict(depth)	