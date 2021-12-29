defmodule CapstoneWeb.Plugs.AuthenticateUser do
  import Plug.Conn

  alias Capstone.Accounts

  def init(default), do: default

  def call(conn, _default) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "User login required!")
        |> Phoenix.Controller.redirect(to: "/session/new")
        |> halt()

      user_id ->
        assign(conn, :user, Accounts.get_user!(user_id))
    end
  end
end
