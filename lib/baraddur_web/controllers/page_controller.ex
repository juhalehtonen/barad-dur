defmodule BaradDurWeb.PageController do
  use BaradDurWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
