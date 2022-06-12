defmodule LifinanceWeb.RevenueLive.Show do
  use LifinanceWeb, :live_view

  alias Lifinance.Receipts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:revenue, Receipts.get_revenue!(id))}
  end

  defp page_title(:show), do: "Show Revenue"
  defp page_title(:edit), do: "Edit Revenue"
end
