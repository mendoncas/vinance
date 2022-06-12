defmodule LifinanceWeb.ExpenseLive.Index do
  use LifinanceWeb, :live_view

  alias Lifinance.Receipts
  alias Lifinance.Receipts.Expense

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :expenses, list_expenses())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Expense")
    |> assign(:expense, Receipts.get_expense!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Expense")
    |> assign(:expense, %Expense{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Expenses")
    |> assign(:expense, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    expense = Receipts.get_expense!(id)
    {:ok, _} = Receipts.delete_expense(expense)

    {:noreply, assign(socket, :expenses, list_expenses())}
  end

  defp list_expenses do
    Receipts.list_expenses()
  end
end
