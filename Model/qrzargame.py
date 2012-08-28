from Model.teamgame import TeamGame
from Model.domainexception import DomainException

class QRzarGame(TeamGame):

	def __init__(self, id_):
		super(QRzarGame, self).__init__(id_)

	def dict(self, depth=0):
		return super(QRzarGame, self).dict(depth)