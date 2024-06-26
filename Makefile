SHELL := /bin/bash

# currently need to delete previous image and rebuild
# because cannot easily create uniquely-named images
# in docker alone
run: cleanup
	docker build -t flask-template . && docker run -p 80:5000 --name flask-template -it flask-template

local:
	docker exec -it flask-template bash

cleanup:
	docker system prune -f
