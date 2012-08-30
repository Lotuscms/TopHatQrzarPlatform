from Model.teamgame import TeamGame
from Model.domainexception import DomainException

class QRzarGame(TeamGame):

	def __init__(self, id_=None):
		super(QRzarGame, self).__init__(id_)