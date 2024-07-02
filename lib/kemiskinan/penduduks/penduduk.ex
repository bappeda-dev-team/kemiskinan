defmodule Kemiskinan.Penduduks.Penduduk do
  use Ecto.Schema
  import Ecto.Changeset

  schema "penduduks" do
    field :kode_unik, :string
    field :nik, :string
    field :nama, :string
    field :tanggal_lahir, :date
    field :jenis_kelamin, :string
    field :kelurahan, :string
    field :kecamatan, :string
    field :kota_kab, :string
    field :nokk, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(penduduk, attrs) do
    penduduk
    |> cast(attrs, [
      :nik,
      :nama,
      :tanggal_lahir,
      :jenis_kelamin,
      :kelurahan,
      :kecamatan,
      :kota_kab,
      :nokk
    ])
    |> validate_required([
      :nik,
      :nama,
      :tanggal_lahir,
      :jenis_kelamin,
      :kelurahan,
      :kecamatan,
      :kota_kab
    ])
    |> validate_length(:nik, is: 16)
    |> validate_inclusion(:jenis_kelamin, ["Laki-laki", "Perempuan"])
  end
end
