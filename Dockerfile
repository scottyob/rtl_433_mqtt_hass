# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY rtl_433_mqtt_hass.py rtl_433_mqtt_hass.py
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

ENTRYPOINT [ "python3", "rtl_433_mqtt_hass.py"]
