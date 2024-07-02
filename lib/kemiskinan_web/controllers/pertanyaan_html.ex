defmodule KemiskinanWeb.PertanyaanHTML do
  use KemiskinanWeb, :html

  embed_templates "pertanyaan_html/*"

  @doc """
  Renders a pertanyaan form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def pertanyaan_form(assigns)

  def kuesioner_opts(changeset) do
    for ket <- Kemiskinan.Keterangan.list_kuesioners(),
        do: [key: ket.jenis, value: ket.id]
  end
end
