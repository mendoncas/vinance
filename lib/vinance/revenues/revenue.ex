defmodule Vinance.Revenues.Revenue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "revenues" do
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(revenue, attrs) do
    revenue
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
