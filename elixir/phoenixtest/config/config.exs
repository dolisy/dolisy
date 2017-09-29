# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenixtest,
  ecto_repos: [Phoenixtest.Repo]

# Configures the endpoint
config :phoenixtest, Phoenixtest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Hx8gGv2XOcH5dGij+wepc4f5PpYXCg9K3psbRLZ83aypObeOB5Nv7v4iRVrYCHPf",
  render_errors: [view: Phoenixtest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phoenixtest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
