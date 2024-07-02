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
end
