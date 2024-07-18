SHELL := /bin/bash

FILENAME = container_name

run: NAME := ${shell echo "flask-template-$$RANDOM"}
run:
	echo $(NAME) > $(FILENAME)
	docker build -t $(NAME) . && \
	docker run -v ./requirements.txt:/app/requirements.txt -p 8000:5000 --name $(NAME) -it $(NAME)

local: NAME := ${shell cat $(FILENAME)}
local:
	docker exec -it $(NAME) bash

fmt:
	@:

lint:
	@:


cleanup:
	docker system prune -f
