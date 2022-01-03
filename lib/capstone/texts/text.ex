defmodule Capstone.Texts.Text do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "texts" do
    field :content, :string
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(text, attrs) do
    text
    |> cast(attrs, [:content, :user_id])
    |> validate_required([:content, :user_id])
  end
end
