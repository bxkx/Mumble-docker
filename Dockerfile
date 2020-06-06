FROM python:3-alpine
RUN apk add --no-cache mumble-server ffmpeg

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

