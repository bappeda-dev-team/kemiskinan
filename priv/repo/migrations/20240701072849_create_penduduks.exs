defmodule Kemiskinan.Repo.Migrations.CreatePenduduks do
  use Ecto.Migration

  def change do
    create table(:penduduks) do
      add :kode_unik, :string
      add :nik, :string
      add :nama, :string
      add :tanggal_lahir, :date
      add :jenis_kelamin, :string
      add :kelurahan, :string
      add :kecamatan, :string
      add :kota_kab, :string
      add :nokk, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:penduduks, [:kode_unik, :nik])
  end
end
