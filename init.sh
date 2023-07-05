#!/bin/sh
mix local.rebar --force
mix deps.get
cd apps/rumbl_web/assets
npm install
cd ../../rumbl
mix ecto.setup
mix run initdb.exs
