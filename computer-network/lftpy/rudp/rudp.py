import socket


class RUdpSender:
    def __init__(self):



class RUdpReceiver:
    def __init__(self):




class RUdp:
    def __init__(self, port=8899):
        self.socket = socket.socket(socket.AF.INET, socket.AF_DGRAM)
        self.socket.bind(("0.0.0.0", port))




