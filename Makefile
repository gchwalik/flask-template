SHELL := /bin/bash

# currently need to delete previous image and rebuild
# because cannot easily create uniquely-named images
# in docker alone
# export name := hiafds
# name ?= RANDOM
# @echo $$name


# name = hat

run:
	NAME="flask-template-$$RANDOM"; echo $$NAME; echo $$NAME > file;
	docker build -t ${echo "$$NAME"} . && docker run -p 80:5000 --name $$NAME -it flask-template

local: name = ${shell cat container_name}
local:
	docker exec -it flask-template bash

cleanup:
	docker system prune -f
