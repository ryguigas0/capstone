defmodule CapstoneWeb.RoomChannel do
  use CapstoneWeb, :channel

  @impl true
  def join("room:lobby", _payload, socket), do: {:ok, socket}

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("new_msg", %{"content" => content, "username" => username}, socket) do
    broadcast!(socket, "new_msg", %{content: content, username: username})
    {:noreply, socket}
  end
end
