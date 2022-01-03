defmodule Capstone.TextsTest do
  use Capstone.DataCase

  alias Capstone.Texts

  describe "texts" do
    alias Capstone.Texts.Text

    import Capstone.TextsFixtures

    @invalid_attrs %{content: nil}

    test "list_texts/0 returns all texts" do
      text = text_fixture()
      assert Texts.list_texts() == [text]
    end

    test "get_text!/1 returns the text with given id" do
      text = text_fixture()
      assert Texts.get_text!(text.id) == text
    end

    test "create_text/1 with valid data creates a text" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %Text{} = text} = Texts.create_text(valid_attrs)
      assert text.content == "some content"
    end

    test "create_text/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Texts.create_text(@invalid_attrs)
    end

    test "update_text/2 with valid data updates the text" do
      text = text_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Text{} = text} = Texts.update_text(text, update_attrs)
      assert text.content == "some updated content"
    end

    test "update_text/2 with invalid data returns error changeset" do
      text = text_fixture()
      assert {:error, %Ecto.Changeset{}} = Texts.update_text(text, @invalid_attrs)
      assert text == Texts.get_text!(text.id)
    end

    test "delete_text/1 deletes the text" do
      text = text_fixture()
      assert {:ok, %Text{}} = Texts.delete_text(text)
      assert_raise Ecto.NoResultsError, fn -> Texts.get_text!(text.id) end
    end

    test "change_text/1 returns a text changeset" do
      text = text_fixture()
      assert %Ecto.Changeset{} = Texts.change_text(text)
    end
  end
end
