defmodule Phoenixfirstapp.PageController do
  use Phoenixfirstapp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
