defmodule VinanceWeb.RevenueController do
  use VinanceWeb, :controller

  alias Vinance.Revenues
  alias Vinance.Revenues.Revenue

  def index(conn, _params) do
    revenues = Revenues.list_revenues()
    render(conn, "index.html", revenues: revenues)
  end

  def new(conn, _params) do
    changeset = Revenues.change_revenue(%Revenue{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"revenue" => revenue_params}) do
    case Revenues.create_revenue(revenue_params) do
      {:ok, revenue} ->
        conn
        |> put_flash(:info, "Revenue created successfully.")
        |> redirect(to: Routes.revenue_path(conn, :show, revenue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    revenue = Revenues.get_revenue!(id)
    render(conn, "show.html", revenue: revenue)
  end

  def edit(conn, %{"id" => id}) do
    revenue = Revenues.get_revenue!(id)
    changeset = Revenues.change_revenue(revenue)
    render(conn, "edit.html", revenue: revenue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "revenue" => revenue_params}) do
    revenue = Revenues.get_revenue!(id)

    case Revenues.update_revenue(revenue, revenue_params) do
      {:ok, revenue} ->
        conn
        |> put_flash(:info, "Revenue updated successfully.")
        |> redirect(to: Routes.revenue_path(conn, :show, revenue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", revenue: revenue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    revenue = Revenues.get_revenue!(id)
    {:ok, _revenue} = Revenues.delete_revenue(revenue)

    conn
    |> put_flash(:info, "Revenue deleted successfully.")
    |> redirect(to: Routes.revenue_path(conn, :index))
  end
end
