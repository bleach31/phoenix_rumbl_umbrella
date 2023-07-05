use Mix.Config

# Configure your database
config :rumbl, Rumbl.Repo,
  username: "gitpod",
  password: "postgres",
  database: "rumbl_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rumbl_web, RumblWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# faster hashing
config :pbkdf2_elixir, :rounds, 1
