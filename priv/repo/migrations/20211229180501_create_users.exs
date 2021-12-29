defmodule Capstone.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :bio, :text
      add :credential, references(:credentials, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:users, [:credential])
  end
end
