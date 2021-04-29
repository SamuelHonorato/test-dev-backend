HEX_HTTP_TIMEOUT=120 MIX_ENV=dev mix deps.get

MIX_ENV=dev mix compile

## Potentially Set up the database
MIX_ENV=dev mix ecto.create
MIX_ENV=dev mix ecto.migrate
MIX_ENV=dev mix run priv/repo/seeds.exs
#
MIX_ENV=dev mix phx.server