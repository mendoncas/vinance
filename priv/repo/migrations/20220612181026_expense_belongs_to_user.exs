defmodule Lifinance.Repo.Migrations.ExpenseBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:expenses) do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
