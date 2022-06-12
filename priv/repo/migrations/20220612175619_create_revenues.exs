defmodule Lifinance.Repo.Migrations.CreateRevenues do
  use Ecto.Migration

  def change do
    create table(:revenues) do
      add :value, :float
      add :date, :string
      add :username, :string

      timestamps()
    end
  end
end
