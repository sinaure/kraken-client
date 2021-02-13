VERSION=dev
PROJECT=asinatra
APP=crypto-executor

build-executor:
	docker-compose build  -t ${PROJECT}/${APP}:${VERSION} executor
push-executor:
	docker push ${PROJECT}/${APP}
run:
	docker-compose build
	docker-compose up 
stop:
	docker-compose down    