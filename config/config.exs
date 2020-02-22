# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :baraddur,
  namespace: BaradDur,
  ecto_repos: [BaradDur.Repo]

# Configures the endpoint
config :baraddur, BaradDurWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sy43V0K8ZZKoLJ2xoIFelaRRlBneFcUAu6fRmLpjiwAw+bpZ+Nvg7Tn6x6EFWTbB",
  render_errors: [view: BaradDurWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BaradDur.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
