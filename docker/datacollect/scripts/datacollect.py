#!/usr/bin/python
import krakenex
from flask_sqlalchemy import SQLAlchemy
import json
import sys
import pandas as pd
from pykrakenapi import KrakenAPI
api = krakenex.API()
k = KrakenAPI(api)
import psycopg2
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from ohlc import Ohlc
from base import Session, engine, Base
import datetime
import schedule
import time
import logging
from logging.handlers import TimedRotatingFileHandler

logging.getLogger('sqlalchemy.engine').setLevel(logging.DEBUG)

# format the log entries
formatter = logging.Formatter('%(asctime)s %(name)s %(levelname)s %(message)s')

handler = TimedRotatingFileHandler('logs/datacollect.log', 
                                   when='midnight',
                                   backupCount=10)
handler.setFormatter(formatter)
logger = logging.getLogger(__name__)
logger.addHandler(handler)
logger.setLevel(logging.DEBUG)

#Base.metadata.create_all(engine)
session = Session()

pairs = ["BTCEUR","OCEANEUR","YFIEUR","SCEUR","BALEUR","BATEUR","EWTEUR","NANOEUR","GNOEUR","ATOMEUR","ANTEUR","KNCEUR","SNXEUR","UNIEUR","KSMEUR","XETHZEUR","XLTCZEUR","ADAEUR","LINKEUR","XXRPZEUR","DOTEUR","EOSEUR","LSKEUR","DAIEUR","DAIUSD","XBTDAI","ETHDAI"]

logging.info('starting monitoring pair: {}', pairs)

def insertToTable(df, pair):
    last = df.iloc[0]
    logging.info(last)
    dt = datetime.datetime.fromtimestamp(last['time'], tz=datetime.timezone.utc)
    
    try:
        ohlc = Ohlc(dt, last.open, last.close, last.high, last.low, last.volume, pair, "kraken")
        session.add(ohlc)
        session.commit()
    except:
        logging.error("Unexpected error while saving: {}", sys.exc_info()[0])
        session.rollback()

def job():
    logging.info("Fetching data")
    for pair in pairs:
            try:
                ohlc, last = k.get_ohlc_data(pair)
                insertToTable(ohlc, pair)
            except:
                logging.error("Unexpected error while fetching data for {}: {}", pair, sys.exc_info()[0])
        
    
logging.info("scheduling")
schedule.every().minute.at(":00").do(job)

while True:
    logging.info('in the loop')
    schedule.run_pending()
    time.sleep(10)
