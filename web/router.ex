defmodule Welcome.Router do
  use Welcome.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Welcome do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/users/login", UserController, :login
    post "/users/login", UserController, :login_user
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Welcome do
  #   pipe_through :api
  # end
end
