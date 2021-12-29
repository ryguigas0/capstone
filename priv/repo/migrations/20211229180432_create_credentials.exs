defmodule Capstone.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :password, :string

      timestamps()
    end
  end
end
