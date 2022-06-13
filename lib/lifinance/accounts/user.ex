defmodule Lifinance.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password, :string
    has_many :revenues, Lifinance.Receipts.Revenue
    has_many :expenses, Lifinance.Receipts.Expense

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password])
    |> unique_constraint(:name)
    |> validate_required([:name, :password])
  end
end
