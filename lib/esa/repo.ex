defmodule Esa.Repo do
  use Ecto.Repo,
    otp_app: :esa,
    adapter: Ecto.Adapters.Postgres
end
