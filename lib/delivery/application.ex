defmodule Delivery.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # Start the Ecto repository
      Delivery.Repo,
      # Start the Telemetry supervisor
      DeliveryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Delivery.PubSub},
      # Start the Endpoint (http/https)
      DeliveryWeb.Endpoint,
#      worker(Mongo, [[database:
#        Application.get_env(:delivery, :db)[:name], name: :mongo]])
      # Start a worker by calling: Delivery.Worker.start_link(arg)
      # {Delivery.Worker, arg}
#      {Mongo, [name: :mongo, database: "delivery_mongo_db", pool_size: 2]}
#      {Mongo, [
#        name: :mongo,
#        database: "delivery_mongo_db",
#        hostname: "delivery_mongo",
#        username: "root",
#        password: "example",
#        pool_size: 2
#      ]}
#      worker(Mongo, [[name: :mongo, database: "delivery_mongo_db", pool_size: 3]]),
#      worker(Mongo, [[name: :mongo, database: "delivery_mongo_db", seeds: ["delivery_mongo:27017"], pool: DBConnection.Pool]])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Delivery.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DeliveryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

