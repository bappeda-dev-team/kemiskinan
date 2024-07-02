defmodule Kemiskinan.Keterangan do
  @moduledoc """
  The Keterangan context.
  """

  import Ecto.Query, warn: false
  alias Kemiskinan.Repo

  alias Kemiskinan.Keterangan.Kuesioner

  @doc """
  Returns the list of kuesioners.

  ## Examples

      iex> list_kuesioners()
      [%Kuesioner{}, ...]

  """
  def list_kuesioners do
    Repo.all(Kuesioner)
  end

  @doc """
  Gets a single kuesioner.

  Raises `Ecto.NoResultsError` if the Kuesioner does not exist.

  ## Examples

      iex> get_kuesioner!(123)
      %Kuesioner{}

      iex> get_kuesioner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_kuesioner!(id), do: Repo.get!(Kuesioner, id)

  @doc """
  Creates a kuesioner.

  ## Examples

      iex> create_kuesioner(%{field: value})
      {:ok, %Kuesioner{}}

      iex> create_kuesioner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_kuesioner(attrs \\ %{}) do
    %Kuesioner{}
    |> Kuesioner.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a kuesioner.

  ## Examples

      iex> update_kuesioner(kuesioner, %{field: new_value})
      {:ok, %Kuesioner{}}

      iex> update_kuesioner(kuesioner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_kuesioner(%Kuesioner{} = kuesioner, attrs) do
    kuesioner
    |> Kuesioner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a kuesioner.

  ## Examples

      iex> delete_kuesioner(kuesioner)
      {:ok, %Kuesioner{}}

      iex> delete_kuesioner(kuesioner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_kuesioner(%Kuesioner{} = kuesioner) do
    Repo.delete(kuesioner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking kuesioner changes.

  ## Examples

      iex> change_kuesioner(kuesioner)
      %Ecto.Changeset{data: %Kuesioner{}}

  """
  def change_kuesioner(%Kuesioner{} = kuesioner, attrs \\ %{}) do
    Kuesioner.changeset(kuesioner, attrs)
  end

  alias Kemiskinan.Keterangan.Pertanyaan

  @doc """
  Returns the list of pertanyaans.

  ## Examples

      iex> list_pertanyaans()
      [%Pertanyaan{}, ...]

  """
  def list_pertanyaans do
    Repo.all(Pertanyaan)
  end

  @doc """
  Gets a single pertanyaan.

  Raises `Ecto.NoResultsError` if the Pertanyaan does not exist.

  ## Examples

      iex> get_pertanyaan!(123)
      %Pertanyaan{}

      iex> get_pertanyaan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pertanyaan!(id), do: Repo.get!(Pertanyaan, id)

  @doc """
  Creates a pertanyaan.

  ## Examples

      iex> create_pertanyaan(%{field: value})
      {:ok, %Pertanyaan{}}

      iex> create_pertanyaan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pertanyaan(attrs \\ %{}) do
    %Pertanyaan{}
    |> Pertanyaan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pertanyaan.

  ## Examples

      iex> update_pertanyaan(pertanyaan, %{field: new_value})
      {:ok, %Pertanyaan{}}

      iex> update_pertanyaan(pertanyaan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pertanyaan(%Pertanyaan{} = pertanyaan, attrs) do
    pertanyaan
    |> Pertanyaan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pertanyaan.

  ## Examples

      iex> delete_pertanyaan(pertanyaan)
      {:ok, %Pertanyaan{}}

      iex> delete_pertanyaan(pertanyaan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pertanyaan(%Pertanyaan{} = pertanyaan) do
    Repo.delete(pertanyaan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pertanyaan changes.

  ## Examples

      iex> change_pertanyaan(pertanyaan)
      %Ecto.Changeset{data: %Pertanyaan{}}

  """
  def change_pertanyaan(%Pertanyaan{} = pertanyaan, attrs \\ %{}) do
    Pertanyaan.changeset(pertanyaan, attrs)
  end
end
