defmodule Kemiskinan.Repo.Migrations.CreateRespons do
  use Ecto.Migration

  def change do
    create table(:respons) do
      add :respons, :string
      add :pertanyaan_id, references(:pertanyaans, on_delete: :delete_all)
      add :penduduk_id, references(:penduduks, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:respons, [:pertanyaan_id])
    create index(:respons, [:penduduk_id])
  end
end
