FROM python:3-slim
RUN apt-get update && apt-get install -y mumble-server ffmpeg python3-dev musl-lib libmagic jpeg-dev zlib-dev gcc && apt-get clean

ADD ./botamusique /bot

RUN pip install wheel
RUN pip install -r /bot/requirements.txt

VOLUME "/mumble"
VOLUME "/bot/config"

EXPOSE 6502
EXPOSE 64738
EXPOSE 8181

COPY start.sh start.sh
RUN chmod 777 start.sh
CMD ["/start.sh"]

