run:
	docker build -t foo . && docker run -p 80:5000 -it foo
