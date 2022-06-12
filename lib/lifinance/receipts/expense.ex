defmodule Lifinance.Receipts.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  schema "expenses" do
    field :date, :string
    field :username, :string
    field :value, :float
    belongs_to :user, Lifinance.Accounts.User


    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:value, :date, :username])
    |> validate_required([:value, :date, :username])
  end
end
