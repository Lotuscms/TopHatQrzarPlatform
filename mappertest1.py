#! /usr/bin/python

def main():
	from Networking.protocolhandler import ProtocolHandler
	from Common.config import TopHatConfig

	#setup the config
	TopHatConfig(path="/home/specialk/Dev/tophat/config.py")

	from Model.qrzargame import QRzarGame
	from Model.Mapper.qrzargamemapper import QRzarGameMapper

	qmapper = QRzarGameMapper()
	game = qmapper.find(1)

	print game

	games = qmapper.findAll()
	if games:
		for x in games:
			print x

if __name__ == "__main__":
    main()