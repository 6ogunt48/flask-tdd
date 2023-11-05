# pull offficia base image
FROM python:3.12.0-slim-bullseye
# set working directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# install system dependencies
RUN apt-get update \
    && apt-get -y install netcat gcc postgresql libpq-dev && apt-get clean

# add and install requirements
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY .  .

# add entry point
COPY ./entrypoint.sh .
RUN chmod +x /usr/src/app/entrypoint.sh