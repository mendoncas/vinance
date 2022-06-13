defmodule Lifinance.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :value, :float
      add :date, :string
      add :username, :string

      timestamps()
    end
  end
end
