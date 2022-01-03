defmodule CapstoneWeb.RoomChannel do
  use CapstoneWeb, :channel

  alias Capstone.{Accounts, Texts}

  @impl true
  def join("room:lobby", _payload, socket), do: {:ok, socket}

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("new_msg", %{"content" => content, "userID" => user_id}, socket) do
    {:ok, text} = Texts.create_text(%{content: content, user_id: user_id})
    username = text.user_id |> Accounts.get_user!() |> Map.get(:name, "undefined")

    broadcast!(socket, "new_msg", %{content: content, username: username})
    {:noreply, socket}
  end
end
