defmodule Vinance.RevenuesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Vinance.Revenues` context.
  """

  @doc """
  Generate a revenue.
  """
  def revenue_fixture(attrs \\ %{}) do
    {:ok, revenue} =
      attrs
      |> Enum.into(%{
        value: 120.5
      })
      |> Vinance.Revenues.create_revenue()

    revenue
  end
end
