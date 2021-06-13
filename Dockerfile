FROM elixir:1.9.0-alpine AS build

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

ENV LANG=C.UTF-8
ENV MIX_ENV=prod

COPY mix.exs mix.lock ./
COPY config config
COPY apps apps

RUN mix do deps.get, deps.compile

RUN mix do compile, release

FROM alpine:3.9 AS app
RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/auth_example ./

ENV HOME=/app

CMD ["bin/auth_example", "start"]