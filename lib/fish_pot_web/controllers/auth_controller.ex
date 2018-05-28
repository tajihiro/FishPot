defmodule FishPotWeb.AuthController do
  use FishPotWeb, :controller

  def login(conn, _params) do
    render conn, "login.html"
  end

  def authenticate(conn, _params) do
    conn
    |> put_flash(:info, "Login successfully.")
    |> redirect(to: user_path(conn, :index))

  end

  def logout(conn, _params) do
    render conn, "logout.html"
  end
end
