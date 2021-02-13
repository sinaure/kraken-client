#!/usr/bin/python

from flask import Flask, request, jsonify, render_template
import os, sys, logging, json, argparse 
from configparser import ConfigParser
import requests
import krakenex
import psycopg2
#from validator_collection import validators, checkers
import validators
import json
from model import krakenOrder as KrakenOrder
kraken = krakenex.API()
kraken.load_key('kraken.key')


app = Flask(__name__)


import logging

logging.basicConfig(filename='logs/executor.log', level=logging.DEBUG)

import datetime
import calendar
import time
# takes date and returns nix time
def date_nix(str_date):
    return calendar.timegm(str_date.timetuple())

# takes nix time and returns date
def date_str(nix_time):
    return datetime.datetime.fromtimestamp(nix_time).strftime('%m, %d, %Y')

# return formatted TradesHistory request data
def date(start, end, ofs):
    req_data = {'type': 'all',
                'trades': 'true',
                'start': str(date_nix(start)),
                'end': str(date_nix(end)),
                'ofs': str(ofs)
                }
    return req_data

##### KRAKEN ROUTES #####
@app.route('/addOrder', methods=['POST'])
def addOrder():
    content = request.get_json()
    logging.info('add Order start')
    logging.debug(content)
    type = content['type']
    logging.info('order type: {}',type)
    ordertype = content['ordertype']
    pair = content['pair']
    volume = content['volume']
    
    if(content['ordertype'] == 'limit'):
        price = content['price']
        response = kraken.query_private('AddOrder',
                                        {'pair': pair,
                                         'type': type,
                                         'ordertype': ordertype,
                                         'volume': volume,
                                         'price': price
                                         })
        
    if(content['ordertype'] == 'market'):
        response = kraken.query_private('AddOrder',
                                    {'pair': pair,
                                     'type': type,
                                     'ordertype': ordertype,
                                     'volume': volume
                                     })
     
    return response
    
@app.route('/cancelOrder', methods=['POST'])
def cancelOrder():
    content = request.get_json()
    logging.info('cancel Order start')
    logging.debug(content)
    txid = content['txid']

    response = kraken.query_private('CancelOrder',
                                    {'txid': txid
                                     })
    return response


@app.route('/balance', methods=['GET'])
def getBalance():
    balance = kraken.query_private('Balance')
    
    return balance 

@app.route('/openOrders', methods=['GET'])
def getOpenOrders():
    openOrders = kraken.query_private('OpenOrders')
    
    return openOrders  

@app.route('/tradesHistory', methods=['GET'])
def getTradesHistory():
    now = datetime.now()
    start = now - timedelta(days=1)
    tradesHistory = kraken.query_private('TradesHistory', {'type': 'all'})
    
    return tradesHistory  


from flask_cors import CORS
CORS(app)


@app.after_request
def after_request(response):
  response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS,PATCH')
  return response

#MAIN FUNCTION OF THE SERVER

if __name__ == '__main__':
    #RUN SERVER
    app.run(debug=True,host='0.0.0.0',port=5001)

