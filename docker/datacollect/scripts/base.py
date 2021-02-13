#!/usr/bin/python
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os

connection = 'postgresql://{}:{}@{}:{}/{}'.format(os.getenv('user', 'executor'), os.getenv('password', '123456'),os.getenv('host', 'localhost'),os.getenv('port', 5432),os.getenv('database', 'crypto-executor'))
engine = create_engine(connection)
Session = sessionmaker(bind=engine)

Base = declarative_base()