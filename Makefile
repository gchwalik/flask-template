run:
	docker build -t flask-template . && docker run -p 80:5000 --name flask-template -it flask-template

local:
	 docker exec -it flask-template bash
