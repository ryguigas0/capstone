defmodule Capstone.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Capstone.Accounts.Credential

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :bio, :string
    field :name, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :bio])
    |> validate_required([:name, :bio])
  end
end
