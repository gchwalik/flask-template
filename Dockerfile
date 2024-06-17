FROM python:3.12.4-bookworm

WORKDIR /app

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY . .
ENV FLASK_APP=hello.py
CMD [ "flask", "run", "--host=0.0.0.0"]