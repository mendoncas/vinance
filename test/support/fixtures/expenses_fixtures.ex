defmodule Vinance.ExpensesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Vinance.Expenses` context.
  """

  @doc """
  Generate a expense.
  """
  def expense_fixture(attrs \\ %{}) do
    {:ok, expense} =
      attrs
      |> Enum.into(%{
        value: 120.5
      })
      |> Vinance.Expenses.create_expense()

    expense
  end
end
