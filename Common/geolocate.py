import math

def findLatBoundaryDistance(dist):
	"""Given the distance in km find the difference that would make to latitude value"""
	diff = (dist /6371.01 * 2 * math.pi) * 360
	
	return diff