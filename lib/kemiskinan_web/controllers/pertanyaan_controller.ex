defmodule KemiskinanWeb.PertanyaanController do
  use KemiskinanWeb, :controller

  alias Kemiskinan.Keterangan
  alias Kemiskinan.Keterangan.Pertanyaan

  def index(conn, _params) do
    pertanyaans = Keterangan.list_pertanyaans()
    render(conn, :index, pertanyaans: pertanyaans)
  end

  def new(conn, _params) do
    changeset = Keterangan.change_pertanyaan(%Pertanyaan{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"pertanyaan" => pertanyaan_params}) do
    case Keterangan.create_pertanyaan(pertanyaan_params) do
      {:ok, pertanyaan} ->
        conn
        |> put_flash(:info, "Pertanyaan created successfully.")
        |> redirect(to: ~p"/pertanyaans/#{pertanyaan}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pertanyaan = Keterangan.get_pertanyaan!(id)
    render(conn, :show, pertanyaan: pertanyaan)
  end

  def edit(conn, %{"id" => id}) do
    pertanyaan = Keterangan.get_pertanyaan!(id)
    changeset = Keterangan.change_pertanyaan(pertanyaan)
    render(conn, :edit, pertanyaan: pertanyaan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pertanyaan" => pertanyaan_params}) do
    pertanyaan = Keterangan.get_pertanyaan!(id)

    case Keterangan.update_pertanyaan(pertanyaan, pertanyaan_params) do
      {:ok, pertanyaan} ->
        conn
        |> put_flash(:info, "Pertanyaan updated successfully.")
        |> redirect(to: ~p"/pertanyaans/#{pertanyaan}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, pertanyaan: pertanyaan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pertanyaan = Keterangan.get_pertanyaan!(id)
    {:ok, _pertanyaan} = Keterangan.delete_pertanyaan(pertanyaan)

    conn
    |> put_flash(:info, "Pertanyaan deleted successfully.")
    |> redirect(to: ~p"/pertanyaans")
  end
end
