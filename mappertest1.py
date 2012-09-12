#! /usr/bin/python

def main():
	from Networking.protocolhandler import ProtocolHandler
	from Common.config import TopHatConfig

	#setup the config
	TopHatConfig(path="/home/specialk/Dev/tophat/config.py")

	from Model.Mapper.qrzargamemapper import QRzarGameMapper
	from Model.Mapper.usermapper import UserMapper

	# get
	UM = UserMapper()
	user = UM.find(1)

	GM = QRzarGameMapper()
	game = GM.find(1)

	# build
	from Model.depth import Depth
	import pprint

	dic = Depth.build(user, 3)
	pprint.pprint(dic)

	print ""
	print "***********************************************"
	print ""

	dic = Depth.build(game, 3)
	pprint.pprint(dic)

if __name__ == "__main__":
    main()