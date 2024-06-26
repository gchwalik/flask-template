import click

from . import db

@click.command('init-db')
def init_db_command():
    """Clear the existing data and create new tables."""
    db.init_db()
    click.echo('Initialized the database.')
