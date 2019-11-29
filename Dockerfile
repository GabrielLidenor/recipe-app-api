FROM python:3.7-alpine
MAINTAINER Gabriel Lidenor

# does not allow python to buffer the outputs
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# creates an user to run applications only
RUN adduser -D glidenor
USER glidenor
