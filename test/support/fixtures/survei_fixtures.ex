defmodule Kemiskinan.SurveiFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kemiskinan.Survei` context.
  """

  @doc """
  Generate a respons.
  """
  def respons_fixture(attrs \\ %{}) do
    {:ok, respons} =
      attrs
      |> Enum.into(%{
        respons: "some respons"
      })
      |> Kemiskinan.Survei.create_respons()

    respons
  end
end
