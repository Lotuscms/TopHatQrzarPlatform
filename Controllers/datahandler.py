import traceback, sys

from Request.requestcontroller import RequestController
from Model.jsonparser import JsonParser
from Request.response import Response
from Networking.statuscodes import StatusCodes
from Model.jsonencoder import JsonEncoder
from Request.requesterrors import RequestError

class DataHandler:

	def __init__(self):
		pass

	def handleIt(self, opcode, uri, key, data, depth=0):
	
		response = None
		#print data
		try:
			if depth > 3:
				raise AssertionError("Depth cannot be greater than 3")

			if opcode is 0:
				RC = RequestController(opcode, uri, key, None, depth)
			elif opcode is 1:
				RC = RequestController(opcode, uri, key, JsonParser.getObject(data), depth)
			elif opcode is 2:
				RC = RequestController(opcode, uri, key, JsonParser.getObject(data), depth)
			elif opcode is 3:
				RC = RequestController(opcode, uri, key, None, depth)

			RC.run()

			if RC.response is not None:
				response = RC.response
			else:
				response = Response("No data returned from requests controller.", StatusCodes.SERVER_ERROR)

		except RequestError as e:
			# Handles Errors raised in requests. Errors contain a message and errorcode.
			traceback.print_exc()
			response = Response(e.message, e.code)

		except ValueError as e:
			traceback.print_exc()
			response = Response("JSON Data was invalid.", StatusCodes.BAD_REQUEST)

		except Exception as e:
			# Return Server error message with the stacktrace
			traceback.print_exc()
			response = Response(e.message, StatusCodes.SERVER_ERROR)

		if response.code is StatusCodes.OK or response.code is StatusCodes.CREATED:
			response.json = JsonEncoder.toJson(response.data)
		else:
			response.json = JsonEncoder.toJson({"error_code": response.code, "error_message": response.data})

		return response
