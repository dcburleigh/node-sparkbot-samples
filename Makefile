
# Leave as if if you 're just using, customizing or extending the machine
# Change it to your docker account if you plan to package and release your own docker image
DOCKER_ACCOUNT=objectisadvantag

# Set this the your Host interface if you use DockerToolbox, otherwise leave it to 127.0.01
DOCKER_HOST_IPADDRESS=192.168.99.100
DOCKER_HOST_IPADDRESS=127.0.0.1

# set the container name explicitly 
CNAME=sparkbot

ENVOPT=
ENVOPT=--env-file=.env

SCRIPTFILE=quickstart/onEvent-all-all.js
SCRIPTFILE=examples/helloworld.js

# Customize makefile variables
-include makefile.conf

default: dev

dev:
	DEBUG=samples*,sparkbot* node templates/on-event-all-all.js

run:
	(lt -s sparkbot -p 8080 &)
	node templates/on-event-all-all.js

dimage:
	docker build -t $(DOCKER_ACCOUNT)/node-sparkbot-samples .

ddev: 
	docker run -it -p 8080:8080 $(DOCKER_ACCOUNT)/node-sparkbot-samples

drun: 
	docker run -it -p 8080:8080 $(ENVOPT) --rm --name $(CNAME) $(DOCKER_ACCOUNT)/node-sparkbot-samples

set-container-script: $(SCRIPTFILE) 
	@echo build using $(SCRIPTFILE) 
	perl -p -i.tmp -e's|SCRIPT .+|SCRIPT $(SCRIPTFILE)|'  Dockerfile


drun-script: set-container-script  dimage  drun



