defmodule Kemiskinan.Repo.Migrations.CreateKuesioners do
  use Ecto.Migration

  def change do
    create table(:kuesioners) do
      add :jenis, :string
      add :penyedia, :string
      add :tahun, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
