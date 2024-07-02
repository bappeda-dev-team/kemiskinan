defmodule Kemiskinan.Repo.Migrations.CreatePertanyaans do
  use Ecto.Migration

  def change do
    create table(:pertanyaans) do
      add :pertanyaan, :string
      add :konsep, :text
      add :metodologi, :text

      timestamps(type: :utc_datetime)
    end
  end
end
