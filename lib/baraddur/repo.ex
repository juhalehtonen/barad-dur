defmodule BaradDur.Repo do
  use Ecto.Repo,
    otp_app: :baraddur,
    adapter: Ecto.Adapters.Postgres
end
