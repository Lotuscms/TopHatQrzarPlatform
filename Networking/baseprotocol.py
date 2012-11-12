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
		config=TopHatConfig().getConfig()
		try:
			uidNumber= getpwnam(config.User)[2] 
			print "Dropped privileges to user '%s'. Cool pops." % config.User
		except KeyError:
			print "Failed to drop privileges to user '%s'. Uh-oh." % config.User
			print "Attempting to drop to user 'nobody'"
			try:
				uidNumber= getpwnam('nobody')[2]
				print "Dropped privileges to 'nobody'. Phew!"
			except:
				print "No user 'nobody' on this system, bit mad, I'm outta here so."
				print "[TopHat-Service failed to start]"
				exit(1)
		try:
			gidNumber= getgrnam(config.User)[2] 
			print "Dropped privileges to group '%s'. Nice." % config.User
		except KeyError:
			print "Failed to drop privileges to group '%s'. :-S" % config.User
			print "Attempting to drop to group 'daemon'"
			try:
				gidNumber= getgrnam('daemon')[2]
				
				print "Dropped privileges to group 'daemon'. It seems we're in the clear, for now."
			except:
				print "No group 'nobody' on this system, I'm not going to let you run me as root. Sorry."
				print "[TopHat-Serivce failed to start]"
				exit(1)

	@abstractmethod
	def _registerStatusCodes(self):
		pass