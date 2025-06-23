defmodule FitproWeb.PageController do
  use FitproWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
 def index(conn, _params) do
    # The index page can be a simple listing or dashboard.
    render(conn, :index)
  end

  def dashboard(conn, _params) do
    # Render the dashboard page for authenticated users.
    render(conn, :dashboard)
  end
  def continue_guest(conn, _params) do
    # Render the continue guest page for users who want to continue as a guest.
    render(conn, :continue_guest, layout: false)
  end
  def profile(conn, _params) do
    # Render the user profile page.
    render(conn, :profile, layout: false)
  end
end
