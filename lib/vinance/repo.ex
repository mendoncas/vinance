defmodule Vinance.Repo do
  use Ecto.Repo,
    otp_app: :vinance,
    adapter: Ecto.Adapters.Postgres
end
