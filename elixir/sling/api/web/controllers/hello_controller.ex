defmodule Sling.HelloController do
  use Sling.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
