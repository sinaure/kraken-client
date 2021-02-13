import json

class KrakenOrder():
    def __init__(self, pair, type, ordertype, volume, price):
        self.pair = pair
        self.type = type
        self.ordertype = ordertype
        self.volume = volume
        self.price = price
        
        
