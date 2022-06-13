defmodule Lifinance.ReceiptsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lifinance.Receipts` context.
  """

  @doc """
  Generate a expense.
  """
  def expense_fixture(attrs \\ %{}) do
    {:ok, expense} =
      attrs
      |> Enum.into(%{
        date: "some date",
        username: "some username",
        value: 120.5
      })
      |> Lifinance.Receipts.create_expense()

    expense
  end

  @doc """
  Generate a revenue.
  """
  def revenue_fixture(attrs \\ %{}) do
    {:ok, revenue} =
      attrs
      |> Enum.into(%{
        date: "some date",
        username: "some username",
        value: 120.5
      })
      |> Lifinance.Receipts.create_revenue()

    revenue
  end
end
