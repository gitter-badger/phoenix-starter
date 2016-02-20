use Mix.Config

config :phoenix_guardian, PhoenixGuardian.Endpoint,
  http: [port: {:system, "PORT"}],
  url:  [host: System.get_env("STAG_HOST"), port: 80],
  cache_static_manifest: "priv/static/manifest.json"

config :ineedthis, Ineedthis.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("STAG_DB_URL"),
  pool_size: 20

config :logger, level: :info
