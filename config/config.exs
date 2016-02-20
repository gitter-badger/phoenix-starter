use Mix.Config

config :phoenix_guardian, PhoenixGuardian.Endpoint,
  url:             [host: "localhost"],
  root:            Path.dirname(__DIR__),
  secret_key_base: "m6b9EGgoTxATviy/Ujx2stZC8UXkw2MMXACAXQR1btpZtV+FtQfl9kL7WoU5mvrD",
  render_errors:   [accepts: ~w(html json)],
  pubsub: [
    name:    PhoenixGuardian.PubSub,
    adapter: Phoenix.PubSub.PG2
  ]

config :logger, :console,
  format:   "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :generators,
  migration: true,
  binary_id: false

config :guardian, Guardian,
  issuer:        "PhoenixGuardian.#{Mix.env}",
  ttl:           {30, :days},
  verify_issuer: true,
  serializer:    PhoenixGuardian.GuardianSerializer,
  secret_key:    to_string(Mix.env),
  hooks:         GuardianDb,
  permissions: %{
    default: [
      :read_profile,
      :write_profile,
      :read_token,
      :revoke_token,
    ],
  }

config :ueberauth, Ueberauth,
  providers: [
    github:   { Ueberauth.Strategy.Github,   [uid_field: "login"] },
    slack:    { Ueberauth.Strategy.Slack,    [default_scope: "users:read,identify"] },
    google:   { Ueberauth.Strategy.Google,   [] },
    facebook: { Ueberauth.Strategy.Facebook, [profile_fields: "email, name"] },
    identity: { Ueberauth.Strategy.Identity, [callback_methods: ["POST"]] },
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id:     System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Slack.OAuth,
  client_id:     System.get_env("SLACK_CLIENT_ID"),
  client_secret: System.get_env("SLACK_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id:     System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET"),
  redirect_uri:  "http://lvh.me:4000/auth/google/callback"

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id:     System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET"),
  redirect_uri:  "http://lvh.me:4000/auth/facebook/callback"

config :guardian_db, GuardianDb, repo: PhoenixGuardian.Repo

import_config "#{Mix.env}.exs"
