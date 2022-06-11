defmodule Vinance.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :value, :float
      add :account_id, references(:accounts)

      timestamps()
    end
  end
end
