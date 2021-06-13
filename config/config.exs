# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :api,
  generators: [context_app: false]

# Configures the endpoint
config :api, Api.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JSld7CPMF8tYQTLkG9Cit3Mh2x/DB2I5+4P26D5xgRsQfEJbRF+MA61AkhYGyF8I",
  render_errors: [view: Api.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Api.PubSub,
  live_view: [signing_salt: "lttXhV7U"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
