use Mix.Config

config :phoenix_guardian, PhoenixGuardian.Endpoint,
  http:   [port: 4001],
  server: true

config :logger, level: :warn

config :phoenix_guardian, PhoenixGuardian.Repo,
  adapter:  Ecto.Adapters.Postgres,
  username: System.get_env("TEST_DB_USERNAME"),
  password: System.get_env("TEST_DB_PASSWORD"),
  database: System.get_env("TEST_DB_NAME"),
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 1 # Use a single connection for transactional tests
