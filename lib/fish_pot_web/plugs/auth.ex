defmodule FishPotWeb.Auth do
  import Plug.Conn

  def init(opts) do
    Keyword.fetch!(opts, :repo)
    IO.puts("init!!")
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    IO.puts("call!!!")
    user = user_id && repo.get(FishPot.Admin.User, :id)
    assign(conn, :current_user, user)
    conn
  end
end

