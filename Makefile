SHELL := /bin/bash

# currently need to delete previous image and rebuild
# because cannot easily create uniquely-named images
# in docker alone
# export name := hiafds
# name ?= RANDOM
# @echo $$name


# name = hat

run: name = ${shell cat container_name}
run:
	@echo $(name)
	@echo $$object
	# name := $(flask-template-$$RANDOM")
	# @echo "flask-template-$$RANDOM" > container_name
	# docker build -t flask-template . && docker run -p 80:5000 --name flask-template -it flask-template

local: name = ${shell cat container_name}
	docker exec -it flask-template bash

cleanup:
	docker system prune -f
