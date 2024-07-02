defmodule Kemiskinan.Keterangan.Kuesioner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "kuesioners" do
    field :jenis, :string
    field :penyedia, :string
    field :tahun, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(kuesioner, attrs) do
    kuesioner
    |> cast(attrs, [:jenis, :penyedia, :tahun])
    |> validate_required([:jenis, :penyedia, :tahun])
  end
end
