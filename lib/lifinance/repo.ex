defmodule Lifinance.Repo do
  use Ecto.Repo,
    otp_app: :lifinance,
    adapter: Ecto.Adapters.Postgres
end
