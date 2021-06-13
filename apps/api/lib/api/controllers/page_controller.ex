defmodule Api.PageController do
  use Api, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hello(conn, _params) do
    json(conn, %{id: "hello nick"})
  end
end
