defmodule Kemiskinan.PenduduksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kemiskinan.Penduduks` context.
  """

  @doc """
  Generate a penduduk.
  """
  def penduduk_fixture(attrs \\ %{}) do
    {:ok, penduduk} =
      attrs
      |> Enum.into(%{
        jenis_kelamin: "some jenis_kelamin",
        kecamatan: "some kecamatan",
        kelurahan: "some kelurahan",
        kode_unik: "some kode_unik",
        kota_kab: "some kota_kab",
        nama: "some nama",
        nik: "some nik",
        tanggal_lahir: ~D[2024-06-30]
      })
      |> Kemiskinan.Penduduks.create_penduduk()

    penduduk
  end
end
