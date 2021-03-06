defmodule FishPotWeb.Router do
  use FishPotWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
#    plug FishPotWeb.Auth, repo: FishPotWeb.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FishPotWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", AuthController, :login
    get "/auth", AuthController, :authenticate
    get "/logout", AuthController, :logout

    get "/upload", UploadController, :index
    post "/upload", UploadController, :create

    resources "/users", UserController
    resources "/workers", WorkerController
    resources "/companies", CompanyController
    resources "/projects", ProjectController
    resources "/jobs", JobController

  end

  # Other scopes may use custom stacks.
  # scope "/api", FishPotWeb do
  #   pipe_through :api
  # end
end
