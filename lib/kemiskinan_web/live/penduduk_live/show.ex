defmodule KemiskinanWeb.PendudukLive.Show do
  use KemiskinanWeb, :live_view

  alias Kemiskinan.Penduduks

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:penduduk, Penduduks.get_penduduk!(id))}
  end

  defp page_title(:show), do: "Show Penduduk"
  defp page_title(:edit), do: "Edit Penduduk"
end
