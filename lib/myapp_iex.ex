defmodule MyappIex do
  @moduledoc """
  Documentation for MyappIex.
  """

  use Application

    def start(_type, _args) do
      MyappIex.Supervisor.start_link()
    end

    alias Hipchat.ApiClient
    alias Hipchat.Httpc.Response
    alias Hipchat.V2.Rooms

    def main([room_id, msg]) do
      client = ApiClient.new(load_token())
      {:ok, %Response{status: 201}} = Rooms.send_message(client, room_id, %{message: msg})
    end

    defp load_token() do
      Path.expand("~/.config/hipchat_cli/token")
      |> File.read!()
      |> String.trim()
    end




  @doc """
  Hello world.

  ## Examples

      iex> MyappIex.hello
      :world

  """
  def hello do
      :world
    end
  end
