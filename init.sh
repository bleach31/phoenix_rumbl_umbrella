#!/bin/sh
mix local.rebar --force
mix deps.get
cd apps/rumble_web/assets && npm install
cd ../../rumble/
mix ecto.setup
mix run initdb.exs
