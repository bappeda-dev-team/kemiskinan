defmodule KemiskinanWeb.ResponsHTML do
  use KemiskinanWeb, :html

  embed_templates "respons_html/*"

  @doc """
  Renders a respons form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def respons_form(assigns)

  def pertanyaan_opts() do
    for pt <- Kemiskinan.Keterangan.list_pertanyaans(),
        do: [key: "#{pt.kuesioner.jenis} - #{pt.pertanyaan}", value: pt.id]
  end

  def penduduk_opts() do
    for pn <- Kemiskinan.Penduduks.list_penduduks(),
        do: [key: "#{pn.nik} - #{pn.nama}", value: pn.id]
  end
end
