defmodule FishPotWeb.UploadController do
  use FishPotWeb, :controller

  alias FishPot.Admin
  alias FishPot.Admin.User

  def index(conn, _params) do
    changeset = Admin.change_user(%User{})

    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
      IO.inspect user_params
      if upload = user_params["photo"] do
        extension = Path.extname(upload.filename)
        File.cp(upload.path, "media/profile#{extension}")
#        File.cp(upload.path, "/Users/tajihiro/Works/Blowfish/FishPot/priv/static/media/profile#{extension}")
      end
      conn
      |> put_flash(:info, "File Uploaded successfully.")
      |> redirect(to: upload_path(conn, :index))
  end
end
