defmodule CapstoneWeb.PageController do
  use CapstoneWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
