FROM python:3.7-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /home/TODO
WORKDIR /home/TODO


RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev

COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache

RUN apk del .tmp-build-deps

COPY . .

RUN addgroup -S dev
RUN adduser -S todo -G dev

RUN chown -R todo:dev /home/todo
RUN chmod 755 /home/todo

USER todo

RUN chmod +x scripts/entrypoint.sh
ENTRYPOINT ["/home/todo/scripts/entrypoint.sh"]