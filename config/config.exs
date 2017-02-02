# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :device,
  ecto_repos: [Device.Repo]

# Configures the endpoint
config :device, Device.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LvfPdh4+vcSSQ2Ru8VfVgIFMI6Bi0+tr7tlgAJRRbcIFR6cEBfr//OTUYSNlxCCH",
  render_errors: [view: Device.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Device.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
