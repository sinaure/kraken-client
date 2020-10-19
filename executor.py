import krakenex

def main():
    kraken = krakenex.API()
    kraken.load_key('kraken.key')

    response = kraken.query_private('AddOrder',
                                    {'pair': 'ADAEUR',
                                     'type': 'buy',
                                     'ordertype': 'market',
                                     'volume': '100'
                                     })
    return response

if __name__ == '__main__':
    ret = main()
    print(ret)