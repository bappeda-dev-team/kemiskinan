defmodule KemiskinanWeb.PendudukLive.Index do
  use KemiskinanWeb, :live_view

  alias Kemiskinan.Penduduks
  alias Kemiskinan.Penduduks.Penduduk

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :penduduks, Penduduks.list_penduduks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Penduduk")
    |> assign(:penduduk, Penduduks.get_penduduk!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Input Penduduk")
    |> assign(:penduduk, %Penduduk{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Data Penduduk")
    |> assign(:penduduk, nil)
  end

  @impl true
  def handle_info({KemiskinanWeb.PendudukLive.FormComponent, {:saved, penduduk}}, socket) do
    {:noreply, stream_insert(socket, :penduduks, penduduk)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    penduduk = Penduduks.get_penduduk!(id)
    {:ok, _} = Penduduks.delete_penduduk(penduduk)

    {:noreply, stream_delete(socket, :penduduks, penduduk)}
  end
end
