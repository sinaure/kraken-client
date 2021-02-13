#!/usr/bin/python
from sqlalchemy import Column, String, Integer, ForeignKey, DateTime, Float, BigInteger
from base import Base

class Ohlc(Base):
    __tablename__ = 'ohlc'
    time = Column(DateTime, primary_key=True)
    open = Column(Float)
    close = Column(Float)
    volume = Column(Float)
    low = Column(Float)
    high = Column(Float)
    pair = Column(String, primary_key=True)
    source = Column(String)

    def __init__(self, time, open, close, high,  low, volume , pair, source):
        self.time = time
        self.open = open
        self.close = close
        self.volume = volume
        self.low = low
        self.high = high
        self.pair = pair
        self.source = source
        