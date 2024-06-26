import os

from flask import Flask

from . import db, click

# factory method
def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # populate application config
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flask-template.sqlite'),
    )
    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # endpoints
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    # click commands
    app.cli.add_command(click.init_db_command)

    # cleanup logic
    app.teardown_appcontext(db.close_db)

    return app
