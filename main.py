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
    balance = k.query_private('Balance')
    
    if(balance['error'] is not None):
        return balance['error']
    
    return balance['result']   

@app.route('/openOrders', methods=['GET'])
def getOpenOrders():
    openOrders = kraken.query_private('OpenOrders')
    
    return openOrders  


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

