defmodule KemiskinanWeb.ResponsController do
  use KemiskinanWeb, :controller

  alias Kemiskinan.Survei
  alias Kemiskinan.Survei.Respons

  def index(conn, _params) do
    respons = Survei.list_respons()
    render(conn, :index, respons_collection: respons)
  end

  def new(conn, _params) do
    changeset = Survei.change_respons(%Respons{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"respons" => respons_params}) do
    case Survei.create_respons(respons_params) do
      {:ok, respons} ->
        conn
        |> put_flash(:info, "Respons created successfully.")
        |> redirect(to: ~p"/respons/#{respons}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    respons = Survei.get_respons!(id)
    render(conn, :show, respons: respons)
  end

  def edit(conn, %{"id" => id}) do
    respons = Survei.get_respons!(id)
    changeset = Survei.change_respons(respons)
    render(conn, :edit, respons: respons, changeset: changeset)
  end

  def update(conn, %{"id" => id, "respons" => respons_params}) do
    respons = Survei.get_respons!(id)

    case Survei.update_respons(respons, respons_params) do
      {:ok, respons} ->
        conn
        |> put_flash(:info, "Respons updated successfully.")
        |> redirect(to: ~p"/respons/#{respons}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, respons: respons, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    respons = Survei.get_respons!(id)
    {:ok, _respons} = Survei.delete_respons(respons)

    conn
    |> put_flash(:info, "Respons deleted successfully.")
    |> redirect(to: ~p"/respons")
  end
end
