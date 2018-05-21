defmodule FishPotWeb.WorkerController do
  use FishPotWeb, :controller

  alias FishPot.Admin
  alias FishPot.Admin.Worker

  def index(conn, _params) do
    workers = Admin.list_workers()
    render(conn, "index.html", workers: workers)
  end

  def new(conn, _params) do
    changeset = Admin.change_worker(%Worker{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"worker" => worker_params}) do
    case Admin.create_worker(worker_params) do
      {:ok, worker} ->
        conn
        |> put_flash(:info, "Worker created successfully.")
        |> redirect(to: worker_path(conn, :show, worker))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    worker = Admin.get_worker!(id)
    render(conn, "show.html", worker: worker)
  end

  def edit(conn, %{"id" => id}) do
    worker = Admin.get_worker!(id)
    changeset = Admin.change_worker(worker)
    render(conn, "edit.html", worker: worker, changeset: changeset)
  end

  def update(conn, %{"id" => id, "worker" => worker_params}) do
    worker = Admin.get_worker!(id)

    case Admin.update_worker(worker, worker_params) do
      {:ok, worker} ->
        conn
        |> put_flash(:info, "Worker updated successfully.")
        |> redirect(to: worker_path(conn, :show, worker))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", worker: worker, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    worker = Admin.get_worker!(id)
    {:ok, _worker} = Admin.delete_worker(worker)

    conn
    |> put_flash(:info, "Worker deleted successfully.")
    |> redirect(to: worker_path(conn, :index))
  end
end
