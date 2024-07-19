.PHONY = run local fmt lint cleanup

SHELL := /bin/bash
FILENAME = container_name

NAME := ${shell cat $(FILENAME)}

# share local files with container, for formatting, updating requirements, etc
run: NAME := ${shell echo "flask-template-$$RANDOM"}
run:
	@echo $(NAME) > $(FILENAME)
	@docker build -t $(NAME) . && docker run -v .:/app -p 8000:5000 --name $(NAME) -it $(NAME)

local:
	@docker exec -it $(NAME) bash

fmt: # todo: mypy, isort, flake8
	@docker exec $(NAME) black .

lint:
	@docker exec $(NAME) black --check --color --diff .

cleanup:
	docker system prune -f
