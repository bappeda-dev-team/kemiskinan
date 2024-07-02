defmodule Kemiskinan.Repo.Migrations.AddKuesionerToPertanyaansTable do
  use Ecto.Migration

  def change do
    alter table("pertanyaans") do
      add :kuesioner_id, references(:kuesioners, on_delete: :delete_all)
    end

    create index(:pertanyaans, [:kuesioner_id])
  end
end
