defmodule LifinanceWeb.RevenueLive.FormComponent do
  use LifinanceWeb, :live_component

  alias Lifinance.Receipts

  @impl true
  def update(%{revenue: revenue} = assigns, socket) do
    changeset = Receipts.change_revenue(revenue)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"revenue" => revenue_params}, socket) do
    changeset =
      socket.assigns.revenue
      |> Receipts.change_revenue(revenue_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"revenue" => revenue_params}, socket) do
    save_revenue(socket, socket.assigns.action, revenue_params)
  end

  defp save_revenue(socket, :edit, revenue_params) do
    case Receipts.update_revenue(socket.assigns.revenue, revenue_params) do
      {:ok, _revenue} ->
        {:noreply,
         socket
         |> put_flash(:info, "Revenue updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_revenue(socket, :new, revenue_params) do
    case Receipts.create_revenue(revenue_params) do
      {:ok, _revenue} ->
        {:noreply,
         socket
         |> put_flash(:info, "Revenue created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
