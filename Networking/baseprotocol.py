from abc import ABCMeta, abstractmethod
from Common.config import TopHatConfig
from os import getuid, setuid, setgid
from pwd import getpwnam
from grp import getgrnam
from sys import exit,path
class BaseProtocol:

	__metaclass__ = ABCMeta

	_config = None

	def __init__(self, config):
		self._config = config

	@abstractmethod
	def loop(self):
		pass

	@abstractmethod
	def bind(self):
			pass

	@abstractmethod
	def _registerStatusCodes(self):
		pass
