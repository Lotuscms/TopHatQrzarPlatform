from Model.teamgame import TeamGame
from Model.domainexception import DomainException

class QRzarGame(TeamGame):

	def __init__(self, id_):
		super(QRzarGame, self).__init__(id_)