defmodule LifinanceWeb.RevenueLive.Index do
  use LifinanceWeb, :live_view

  alias Lifinance.Receipts
  alias Lifinance.Receipts.Revenue

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :revenues, list_revenues())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Revenue")
    |> assign(:revenue, Receipts.get_revenue!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Revenue")
    |> assign(:revenue, %Revenue{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Revenues")
    |> assign(:revenue, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    revenue = Receipts.get_revenue!(id)
    {:ok, _} = Receipts.delete_revenue(revenue)

    {:noreply, assign(socket, :revenues, list_revenues())}
  end

  defp list_revenues do
    Receipts.list_revenues()
  end
end
