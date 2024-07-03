defmodule Kemiskinan.Survei do
  @moduledoc """
  The Survei context.
  """

  import Ecto.Query, warn: false
  alias Kemiskinan.Repo

  alias Kemiskinan.Survei.Respons

  @doc """
  Returns the list of respons.

  ## Examples

      iex> list_respons()
      [%Respons{}, ...]

  """
  def list_respons do
    Repo.all(Respons)
    |> Repo.preload(:pertanyaan)
    |> Repo.preload(:penduduk)
  end

  @doc """
  Gets a single respons.

  Raises `Ecto.NoResultsError` if the Respons does not exist.

  ## Examples

      iex> get_respons!(123)
      %Respons{}

      iex> get_respons!(456)
      ** (Ecto.NoResultsError)

  """
  def get_respons!(id) do
    Repo.get!(Respons, id)
    |> Repo.preload(:pertanyaan)
    |> Repo.preload(:penduduk)
  end

  @doc """
  Creates a respons.

  ## Examples

      iex> create_respons(%{field: value})
      {:ok, %Respons{}}

      iex> create_respons(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_respons(attrs \\ %{}) do
    %Respons{}
    |> Respons.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a respons.

  ## Examples

      iex> update_respons(respons, %{field: new_value})
      {:ok, %Respons{}}

      iex> update_respons(respons, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_respons(%Respons{} = respons, attrs) do
    respons
    |> Respons.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a respons.

  ## Examples

      iex> delete_respons(respons)
      {:ok, %Respons{}}

      iex> delete_respons(respons)
      {:error, %Ecto.Changeset{}}

  """
  def delete_respons(%Respons{} = respons) do
    Repo.delete(respons)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking respons changes.

  ## Examples

      iex> change_respons(respons)
      %Ecto.Changeset{data: %Respons{}}

  """
  def change_respons(%Respons{} = respons, attrs \\ %{}) do
    Respons.changeset(respons, attrs)
  end
end
