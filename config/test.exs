import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :user, User.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "user_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :user, UserWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "hHuY1SW2eWFMRj2jaKF9h9B9Jf6rAdkbLCAzl3STtF/TZyqs2m1jW9f7yM3f+wlU",
  server: false

# In test we don't send emails.
config :user, User.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
