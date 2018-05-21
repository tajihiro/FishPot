use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fish_pot, FishPotWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :fish_pot, FishPot.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "",
  database: "fish_pot_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
