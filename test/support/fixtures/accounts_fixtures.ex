defmodule Capstone.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Capstone.Accounts` context.
  """

  @doc """
  Generate a credential.
  """
  def credential_fixture(attrs \\ %{}) do
    {:ok, credential} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password"
      })
      |> Capstone.Accounts.create_credential()

    credential
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        name: "some name"
      })
      |> Capstone.Accounts.create_user()

    user
  end
end
