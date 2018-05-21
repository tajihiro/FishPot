# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fish_pot,
  ecto_repos: [FishPot.Repo]

# Configures the endpoint
config :fish_pot, FishPotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WQzutudDd5zAi+58v4Mj9I0c1FGS7u0nBC3yYtlwWnjvvdRx+gQlkpflhXoQM+dh",
  render_errors: [view: FishPotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FishPot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
