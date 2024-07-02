defmodule Kemiskinan.KeteranganFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kemiskinan.Keterangan` context.
  """

  @doc """
  Generate a kuesioner.
  """
  def kuesioner_fixture(attrs \\ %{}) do
    {:ok, kuesioner} =
      attrs
      |> Enum.into(%{
        jenis: "some jenis",
        penyedia: "some penyedia",
        tahun: 42
      })
      |> Kemiskinan.Keterangan.create_kuesioner()

    kuesioner
  end

  @doc """
  Generate a pertanyaan.
  """
  def pertanyaan_fixture(attrs \\ %{}) do
    {:ok, pertanyaan} =
      attrs
      |> Enum.into(%{
        konsep: "some konsep",
        metodologi: "some metodologi",
        pertanyaan: "some pertanyaan"
      })
      |> Kemiskinan.Keterangan.create_pertanyaan()

    pertanyaan
  end
end
