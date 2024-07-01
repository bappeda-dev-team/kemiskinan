defmodule Kemiskinan.Repo do
  use Ecto.Repo,
    otp_app: :kemiskinan,
    adapter: Ecto.Adapters.Postgres
end
