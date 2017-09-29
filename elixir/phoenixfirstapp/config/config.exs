# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenixfirstapp,
  ecto_repos: [Phoenixfirstapp.Repo]

# Configures the endpoint
config :phoenixfirstapp, Phoenixfirstapp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yabZY6jQyA0Ep1XaZRH+nfMwV93aR5ssQ1sxNH0n97iym9Gu6M6aKouixU4GGSEI",
  render_errors: [view: Phoenixfirstapp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phoenixfirstapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
