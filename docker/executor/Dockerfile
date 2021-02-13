FROM ubuntu:latest
MAINTAINER Aureliano Sinatra "sinaure@gmail.com"
RUN apt-get update -y && apt-get install -y python3 python3-dev python3-pip curl libcurl4-gnutls-dev libgnutls28-dev git libpq-dev 

WORKDIR /app

ADD docker/executor/requirements.txt .
ADD kraken.key .

ENV LC_ALL C.UTF-8
ENV LC_CTYPE C.UTF-8

RUN pip3 install -r requirements.txt
RUN pip3 install -U Flask_Cors
COPY docker/executor/scripts .
EXPOSE 5001
CMD ["python3", "/app/executor.py"]
