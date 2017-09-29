defmodule Phoenixtest.PageController do
  use Phoenixtest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
