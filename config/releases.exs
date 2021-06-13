import Config

config :api, Api.Endpoint, server: true

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :api, Api.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000")
  ],
  secret_key_base: secret_key_base,
  server: true

# pensare se aggiungere la propr url: [host: ] che lo prende dall'enviroment.
