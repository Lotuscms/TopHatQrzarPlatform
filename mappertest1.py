#! /usr/bin/python

def main():
	from Networking.protocolhandler import ProtocolHandler
	from Common.config import TopHatConfig

	#setup the config
	TopHatConfig(path="/home/specialk/Dev/tophat/config.py")

	from Model.Mapper.qrzargamemapper import QRzarGameMapper

	#############
	from Model.Mapper.usermapper import UserMapper
	UM = UserMapper()
	user = UM.find(1)
	user.getGames()

	#for game in user.getGames():
	#	print game

	from Model.depth import Depth
	dic = Depth.build(user, 3)

	import pprint
	pprint.pprint(dic)

if __name__ == "__main__":
    main()