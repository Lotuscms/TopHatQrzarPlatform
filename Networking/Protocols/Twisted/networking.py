from twisted.web.server import Site
from twisted.web.resource import Resource
from twisted.internet import reactor
from Networking.statuscodes import StatusCodes
from Networking.baseprotocol import BaseProtocol

class Protocol(BaseProtocol):

	_config = None

	def __init__(self, config):
		super(Protocol, self).__init__(config)
		self._registerStatusCodes()

	def bind(self):
		from twistedhandler import TwistedHandler
		root = TwistedHandler(self)
		factory = Site(root)
		reactor.listenTCP(self._config.Port, factory)

	def loop(self):
		reactor.run()

	def _registerStatusCodes(self):
		StatusCodes.NONE = 0
		StatusCodes.OK = 200
		StatusCodes.CREATED = 201
		StatusCodes.BAD_REQUEST = 400
		StatusCodes.UNAUTHORISED = 401
		StatusCodes.FORBIDDEN = 403
		StatusCodes.NOT_FOUND = 404
		StatusCodes.METHOD_NOT_ALLOWED = 405
		StatusCodes.CONFLICT = 409
		StatusCodes.SERVER_ERROR = 500
		StatusCodes.UNIMPLEMENTED = 501