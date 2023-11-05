# pull offficia base image
FROM python:3.12.0-slim-bullseye
# set working directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# add and install requirements
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY .  .

# run server
CMD python manage.py run -h 0.0.0.0