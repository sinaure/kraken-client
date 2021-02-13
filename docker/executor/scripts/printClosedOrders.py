#!/usr/bin/env python3
# pretty-print the ClosedOrders using offset parameter for more than 50 records

import sys
import pprint
import krakenex
import time

k = krakenex.API()
k.load_key('kraken.key')

iterations = 0
offSet = 0

while True:
        iterations +=1
        try:
            response = k.query_private('ClosedOrders', {'ofs': offSet})
            filename = 'orders/order-%s.txt' % iterations 
            with open(filename, 'w') as f:
                print(response, file=f)
            count = response['result']['count']
            offSet += 50
            time.sleep(2)
            if (offSet >= 400):
                    print("API offset count is 400 or more")
                    print("We made {0} Calls to the API".format(iterations))
                    raise SystemExit
        except:
            raise SystemExit