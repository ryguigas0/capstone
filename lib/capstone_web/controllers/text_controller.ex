defmodule CapstoneWeb.TextController do
  use CapstoneWeb, :controller

  alias Capstone.Texts

  def index(conn, _params) do
    texts = Texts.list_texts()
    render(conn, "index.html", texts: texts)
  end
end
