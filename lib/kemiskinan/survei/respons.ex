defmodule Kemiskinan.Survei.Respons do
  use Ecto.Schema
  import Ecto.Changeset

  schema "respons" do
    field :respons, :string

    timestamps(type: :utc_datetime)

    belongs_to :pertanyaan, Kemiskinan.Keterangan.Pertanyaan
    belongs_to :penduduk, Kemiskinan.Penduduks.Penduduk
  end

  @doc false
  def changeset(respons, attrs) do
    respons
    |> cast(attrs, [:respons, :pertanyaan_id, :penduduk_id])
    |> validate_required([:respons])
  end
end
