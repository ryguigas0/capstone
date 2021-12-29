defmodule CapstoneWeb.SessionController do
  use CapstoneWeb, :controller

  alias Capstone.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"credentials" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_user_email_password(email, password) do
      {:error, :unathorized} ->
        conn
        |> put_flash(:error, "Wrong password or/and password")
        |> redirect(to: Routes.session_path(conn, :new))
      {:ok, user} ->
        conn
        |> put_flash(:ok, "Welcome #{user.name}!!")
        |> put_session(:user_id, user.id)
        |> configure_session(renew: true)
        |> redirect(to: "/chat")
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> put_flash(:ok, "Goodbye!")
    |> redirect(to: "/")
  end
end
