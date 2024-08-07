import os

from flask import Flask

from flask_template import auth, cli, db


# factory method
def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__)

    # if instance folder doesn't exist, create it
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # populate application config
    app.config.from_mapping(
        SECRET_KEY="dev",
        DATABASE=os.path.join(app.instance_path, "flask_template.sqlite"),
    )
    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile("config.py", silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # endpoints
    @app.route("/hello")
    def hello():
        return "Hello, World!"

    # register blueprints
    app.register_blueprint(auth.bp)

    # click commands
    app.cli.add_command(cli.init_db_command)

    # cleanup logic
    app.teardown_appcontext(db.close_db)

    return app
