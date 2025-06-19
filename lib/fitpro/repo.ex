defmodule Fitpro.Repo do
  use Ecto.Repo,
    otp_app: :fitpro,
    adapter: Ecto.Adapters.Postgres
end
