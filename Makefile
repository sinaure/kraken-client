VERSION=dev
PROJECT=asinatra
APP=crypto-executor

build:
	docker build  -t ${PROJECT}/${APP}:${VERSION} .
push:
	docker push ${PROJECT}/${APP}
run:
	docker-compose up
stop:
	docker-compose down    