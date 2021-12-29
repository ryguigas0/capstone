defmodule Capstone.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  alias Capstone.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "credentials" do
    field :email, :string
    field :password, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
  end
end
