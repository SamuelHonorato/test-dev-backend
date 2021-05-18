# FROM elixir:1.10.2-alpine
# MAINTAINER Samuel
#
# ENV PORT=4000
#
# COPY . /var/www
# WORKDIR /var/www
#
# RUN mix local.hex --force
# RUN mix local.rebar --force
# RUN mix archive.install --force hex phx_new 1.4.16
#
# RUN mix deps.get
# RUN mix compile
#
# RUN mix ecto.create
# RUN mix ecto.migrate
# RUN mix run priv/repo/seeds.exs
#
# ENTRYPOINT ["mix", "phx.server"]
#
# EXPOSE $PORT
#
# # docker build -f Dockerfile -t nomedousuario/elixir .
#
# # ENTRYPOINT ["nginx"]
# # # parametros do entrypoint
# # CMD ["-g", "daemon off;"]