# flask-template

This is a flask project template. It is intended to serve as a project base, allowing clones of it to focus primarily on business logic.

It is dockerized, allowing for consistent behavior between machines.

## Running the app

Run `make run` and it will start up the docker server and expose the server endpoint at `localhost:80`.

Right now, `make run` will create a running container of the app, but the container doesn't have a unique name and will have to be deleted before `make run` can be run again.
