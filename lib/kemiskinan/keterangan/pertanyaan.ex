defmodule Kemiskinan.Keterangan.Pertanyaan do
  use Ecto.Schema
  import Ecto.Changeset

  alias Kemiskinan.Keterangan.Kuesioner

  schema "pertanyaans" do
    field :pertanyaan, :string
    field :konsep, :string
    field :metodologi, :string

    timestamps(type: :utc_datetime)

    belongs_to :kuesioner, Kuesioner
  end

  @doc false
  def changeset(pertanyaan, attrs) do
    pertanyaan
    |> cast(attrs, [:pertanyaan, :konsep, :metodologi, :kuesioner_id])
    |> validate_required([:pertanyaan, :konsep, :metodologi, :kuesioner_id])
  end
end
