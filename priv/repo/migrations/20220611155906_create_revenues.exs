defmodule Vinance.Repo.Migrations.CreateRevenues do
  use Ecto.Migration

  def change do
    create table(:revenues) do
      add :value, :float
      add :account_id, references(:accounts)

      timestamps()
    end
  end
end
