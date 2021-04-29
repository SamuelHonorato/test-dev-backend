FROM elixir:1.10.2-alpine

RUN mkdir /app

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force hex phx_new 1.4.16

RUN apk update

RUN apk add --no-cache bash

RUN apk add inotify-tools

ENTRYPOINT ["sh", "docker/run.sh"]

EXPOSE 4000