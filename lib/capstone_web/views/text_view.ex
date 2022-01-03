defmodule CapstoneWeb.TextView do
  use CapstoneWeb, :view

  alias Capstone.Accounts

  def parse_text(%{text: text}) do

    username = text.user_id |> Accounts.get_user!() |> Map.get(:name, "undefined")
    {:ok, date_time} = DateTime.now("America/Sao_Paulo")
    time = date_time |> Time.to_string |> String.split(".") |> List.first()

    "{#{username}} [#{time}] #{text.content}"
  end
end
