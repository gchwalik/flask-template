FROM python:3.12.4-bookworm

WORKDIR /app

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY . .
# FLASK_APP is name of module to import at flask run
ENV FLASK_APP=flask_template
CMD [ "flask", "init-db"]
