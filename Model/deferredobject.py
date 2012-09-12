from Model.domainobject import DomainObject
from Model.domainexception import DomainException

class DeferredObject:

	_run = False
	_obj = None

	def __init__(self, obj):
		if not isinstance(obj, DomainObject):
			raise DomainException("Must be a Domain Object")

		self._obj = obj

	def __getattr__(self, attr):
		if attr is "_obj" or attr is "_run":
			return self.__dict__[attr]
		else:
			if attr is "getId":
				return getattr(self._obj, attr)
			else:
				self.notifyAccess()
				return getattr(self._obj, attr)

	def __setattr__(self, attr, value):
		if attr is "_obj" or attr is "_run":
			self.__dict__[attr] = value
		else:
			self.notifyAccess()

			return setattr(self._obj, attr, value)

	def notifyAccess(self):
		"""The deffered work code block"""
		# check if the query has been run before
		if not self._run:
			self._obj = self._obj.mapper().find(self._obj.getId())

			self._run = True										# ensure we don't run the query again