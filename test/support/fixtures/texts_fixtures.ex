defmodule Capstone.TextsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Capstone.Texts` context.
  """

  @doc """
  Generate a text.
  """
  def text_fixture(attrs \\ %{}) do
    {:ok, text} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Capstone.Texts.create_text()

    text
  end
end
