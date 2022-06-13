defmodule Lifinance.Receipts.Revenue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "revenues" do
    field :date, :string
    field :username, :string
    # field :user_id, :integer
    field :value, :float
    belongs_to :user, Lifinance.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(revenue, attrs) do
    revenue
    |> cast(attrs, [:value, :date, :user_id])
    |> validate_required([:value, :date, :user_id])
  end
end
