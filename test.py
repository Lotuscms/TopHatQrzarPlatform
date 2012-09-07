#! /usr/bin/python

def main():
	from Common.config import TopHatConfig

	#setup the config
	TopHatConfig(path="/home/specialk/Dev/tophat/config.py")

	from Networking.statuscodes import StatusCodes
	from Request.requestcontroller import RequestController
	from Request.response import Response
	from Request.requesterrors import RequestError

	opcode = 1 #post
	uri = "/players/"
	apikey = "73640de25b7d656733ce2f808a330f18cfc26385c2003a3674b57cab555aa1b2"

	data = {}
	data["name"] = "The Mechanic"
	data["game"] = {}
	data["game"]["id"] = 5
	data["qrcode"] = "G12345"

	rc = RequestController(opcode, uri, apikey, data)
	rc.run()

	print rc.response.code

	import pprint
	pprint.pprint(rc.response.data)


if __name__ == "__main__":
    main()