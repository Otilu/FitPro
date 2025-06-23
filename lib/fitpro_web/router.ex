defmodule FitproWeb.Router do
  use FitproWeb, :router
  import FitproWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FitproWeb.Layouts, :root}
    plug :protect_from_forgery  # Fixed typo here
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  # Changed to use for authenticated HTML routes
  pipeline :auth do
    plug :require_authenticated_user
  end

  scope "/", FitproWeb do
    pipe_through :browser

    # Public routes
    get "/", PageController, :home
    get "/profile", PageController, :profile
   # get "/index", PageController, :index
    #get "/continue-guest", AuthController, :continue_guest
  end

  # Protected routes scope
  scope "/", FitproWeb do
    pipe_through [:browser, :auth]  # Requires authentication

    get "/home", PageController, :home
    get "/dashboard", PageController, :dashboard
    get "/continue-guest", GuestController, :continue
  end

  # ... (keep existing dev routes section) ...

  ## Authentication routes - keep existing generated routes
  scope "/", FitproWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", FitproWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", FitproWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end
end
