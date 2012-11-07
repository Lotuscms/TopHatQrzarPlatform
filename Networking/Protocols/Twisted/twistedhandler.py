from twisted.web.resource import Resource
from urlparse import urlparse, parse_qs
from Controllers.datahandler import DataHandler
from Networking.statuscodes import StatusCodes

class TwistedHandler(Resource):

    networking = None

    isLeaf = True

    def __init__(self, networking):
        self.networking = networking
        self.datahandler = DataHandler()
        Resource.__init__(self)

    def render_GET(self, request):

        key = None

        if "apitoken" in request.args:
            key = str(request.args['apitoken'][0])

        depth = 0
        
        if "depth" in request.args:
            depth = str(request.args['depth'][0])

        response = self.datahandler.handleIt(0, request.path, key, None, depth)

        request.setResponseCode(response.code)
        return response.json

    def render_POST(self, request):
        
        try:
            data = str(request.args['data'][0])
        except:
            data = ""

        key = None
        

        if "apitoken" in request.args:
            key = str(request.args['apitoken'][0])

        depth = 0

        if "depth" in request.args:
            depth = str(request.args['depth'][0])

        response = self.datahandler.handleIt(1, request.path, key, data, depth)

        request.setResponseCode(response.code)
        return response.json

    def render_PUT(self, request):

        try:
            data = str(request.args['data'][0])
        except:
            data = ""

        key = None

        if "apitoken" in request.args:
            key = str(request.args['apitoken'][0])

        depth = 0
        
        if "depth" in request.args:
            depth = str(request.args['depth'][0])

        response = self.datahandler.handleIt(2, request.path, key, data, depth)

        request.setResponseCode(response.code)
        return response.json

    def render_DELETE(self, request):

        key = None

        if "apitoken" in request.args:
            key = str(request.args['apitoken'][0])

        depth = 0
        
        if "depth" in request.args:
            depth = str(request.args['depth'][0])

        response = self.datahandler.handleIt(3, request.path, key, None, depth)

        request.setResponseCode(response.code)
        return response.json