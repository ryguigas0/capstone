defmodule Capstone.Repo.Migrations.CreateTexts do
  use Ecto.Migration

  def change do
    create table(:texts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :text
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:texts, [:user_id])
  end
end
