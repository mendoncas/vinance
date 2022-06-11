defmodule Vinance.Repo.Migrations.AddEmailToAccounts do
  use Ecto.Migration

  def change do
    create unique_index(:accounts, [:username])
  end
end
