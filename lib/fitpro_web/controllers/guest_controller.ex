defmodule FitproWeb.GuestController do
  use FitproWeb, :controller

  def continue(conn, _params) do
    # You can customize this render/redirect
    render(conn, :continue, layout: false)
  end
end
