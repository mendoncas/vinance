defmodule Lifinance.Repo.Migrations.RevenueBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:revenues) do
      add :user_id, references(:users, on_delete: :delete_all)
    end

  end
end
