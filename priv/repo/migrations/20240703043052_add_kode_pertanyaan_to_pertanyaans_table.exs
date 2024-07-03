defmodule Kemiskinan.Repo.Migrations.AddKodePertanyaanToPertanyaansTable do
  use Ecto.Migration

  def change do
    alter table("pertanyaans") do
      add :kode_pertanyaan, :string
    end
  end
end
