#FROM python
FROM francoisgervais/opencv-python:latest

RUN pip3 install --upgrade pip && \
    pip3 install paho-mqtt

WORKDIR /app/
COPY blindmanager /app/
COPY config.json /app/
ENV  PYTHONUNBUFFERED=1
CMD ["/app/blindmanager"]
