from Model.teamplayer import TeamPlayer
from Model.playergeolocate import PlayerGeoLocate
from Model.domainexception import DomainException

class QRzarPlayer(TeamPlayer, PlayerGeoLocate):

	_qrcode = None

	def __init__(self, id_=None):
		super(QRzarPlayer, self).__init__(id_)

	def __str__(self):
		return self._name + " (" + self.getUser().getName() + ") for team " + self.getTeam().getName() + " in game " + self.getTeam().getGame().getName() + " with a score of " + str(self.getScore()) + " (" + str(self.getTime()) + ")"

	def getQRCode(self):
		return self._qrcode

	def setQRCode(self, code):
		if len(code) is not 6:
			raise DomainException("That is not a valid QR Code, it should be 6 characters long not %i characters long" % len(code))

		self._qrcode = code