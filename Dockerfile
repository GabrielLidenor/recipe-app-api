FROM python:3.7-alpine
MAINTAINER Gabriel Lidenor

# does not allow python to buffer the outputs
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# creates an user to run applications only
RUN adduser -D glidenor
USER glidenor
