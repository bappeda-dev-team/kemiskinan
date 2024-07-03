defmodule KemiskinanWeb.KuesionerController do
  use KemiskinanWeb, :controller

  alias Kemiskinan.Keterangan
  alias Kemiskinan.Keterangan.Kuesioner

  def index(conn, _params) do
    kuesioners = Keterangan.list_kuesioners()
    render(conn, :index, kuesioners: kuesioners)
  end

  def new(conn, _params) do
    changeset = Keterangan.change_kuesioner(%Kuesioner{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"kuesioner" => kuesioner_params}) do
    case Keterangan.create_kuesioner(kuesioner_params) do
      {:ok, kuesioner} ->
        conn
        |> put_flash(:info, "Kuesioner created successfully.")
        |> redirect(to: ~p"/kuesioners/#{kuesioner}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    kuesioner = Keterangan.get_kuesioner!(id)
    render(conn, :show, %{kuesioner: kuesioner})
  end

  def edit(conn, %{"id" => id}) do
    kuesioner = Keterangan.get_kuesioner!(id)
    changeset = Keterangan.change_kuesioner(kuesioner)
    render(conn, :edit, kuesioner: kuesioner, changeset: changeset)
  end

  def update(conn, %{"id" => id, "kuesioner" => kuesioner_params}) do
    kuesioner = Keterangan.get_kuesioner!(id)

    case Keterangan.update_kuesioner(kuesioner, kuesioner_params) do
      {:ok, kuesioner} ->
        conn
        |> put_flash(:info, "Kuesioner updated successfully.")
        |> redirect(to: ~p"/kuesioners/#{kuesioner}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, kuesioner: kuesioner, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    kuesioner = Keterangan.get_kuesioner!(id)
    {:ok, _kuesioner} = Keterangan.delete_kuesioner(kuesioner)

    conn
    |> put_flash(:info, "Kuesioner deleted successfully.")
    |> redirect(to: ~p"/kuesioners")
  end
end
