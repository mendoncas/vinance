defmodule Vinance.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Vinance.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        password: "some password",
        username: "some username"
      })
      |> Vinance.Accounts.create_account()

    account
  end
end
