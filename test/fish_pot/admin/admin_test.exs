defmodule FishPot.AdminTest do
  use FishPot.DataCase

  alias FishPot.Admin

  describe "users" do
    alias FishPot.Admin.User

    @valid_attrs %{email: "some email", first_kn_name: "some first_kn_name", first_name: "some first_name", last_kn_name: "some last_kn_name", last_name: "some last_name", passwd: "some passwd", user_id: "some user_id"}
    @update_attrs %{email: "some updated email", first_kn_name: "some updated first_kn_name", first_name: "some updated first_name", last_kn_name: "some updated last_kn_name", last_name: "some updated last_name", passwd: "some updated passwd", user_id: "some updated user_id"}
    @invalid_attrs %{email: nil, first_kn_name: nil, first_name: nil, last_kn_name: nil, last_name: nil, passwd: nil, user_id: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Admin.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Admin.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Admin.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.first_kn_name == "some first_kn_name"
      assert user.first_name == "some first_name"
      assert user.last_kn_name == "some last_kn_name"
      assert user.last_name == "some last_name"
      assert user.passwd == "some passwd"
      assert user.user_id == "some user_id"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Admin.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.first_kn_name == "some updated first_kn_name"
      assert user.first_name == "some updated first_name"
      assert user.last_kn_name == "some updated last_kn_name"
      assert user.last_name == "some updated last_name"
      assert user.passwd == "some updated passwd"
      assert user.user_id == "some updated user_id"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_user(user, @invalid_attrs)
      assert user == Admin.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Admin.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Admin.change_user(user)
    end
  end

  describe "workers" do
    alias FishPot.Admin.Worker

    @valid_attrs %{email: "some email", first_kn_name: "some first_kn_name", first_name: "some first_name", last_kn_name: "some last_kn_name", last_name: "some last_name"}
    @update_attrs %{email: "some updated email", first_kn_name: "some updated first_kn_name", first_name: "some updated first_name", last_kn_name: "some updated last_kn_name", last_name: "some updated last_name"}
    @invalid_attrs %{email: nil, first_kn_name: nil, first_name: nil, last_kn_name: nil, last_name: nil}

    def worker_fixture(attrs \\ %{}) do
      {:ok, worker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_worker()

      worker
    end

    test "list_workers/0 returns all workers" do
      worker = worker_fixture()
      assert Admin.list_workers() == [worker]
    end

    test "get_worker!/1 returns the worker with given id" do
      worker = worker_fixture()
      assert Admin.get_worker!(worker.id) == worker
    end

    test "create_worker/1 with valid data creates a worker" do
      assert {:ok, %Worker{} = worker} = Admin.create_worker(@valid_attrs)
      assert worker.email == "some email"
      assert worker.first_kn_name == "some first_kn_name"
      assert worker.first_name == "some first_name"
      assert worker.last_kn_name == "some last_kn_name"
      assert worker.last_name == "some last_name"
    end

    test "create_worker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_worker(@invalid_attrs)
    end

    test "update_worker/2 with valid data updates the worker" do
      worker = worker_fixture()
      assert {:ok, worker} = Admin.update_worker(worker, @update_attrs)
      assert %Worker{} = worker
      assert worker.email == "some updated email"
      assert worker.first_kn_name == "some updated first_kn_name"
      assert worker.first_name == "some updated first_name"
      assert worker.last_kn_name == "some updated last_kn_name"
      assert worker.last_name == "some updated last_name"
    end

    test "update_worker/2 with invalid data returns error changeset" do
      worker = worker_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_worker(worker, @invalid_attrs)
      assert worker == Admin.get_worker!(worker.id)
    end

    test "delete_worker/1 deletes the worker" do
      worker = worker_fixture()
      assert {:ok, %Worker{}} = Admin.delete_worker(worker)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_worker!(worker.id) end
    end

    test "change_worker/1 returns a worker changeset" do
      worker = worker_fixture()
      assert %Ecto.Changeset{} = Admin.change_worker(worker)
    end
  end

  describe "companies" do
    alias FishPot.Admin.Company

    @valid_attrs %{company_name: "some company_name", url: "some url"}
    @update_attrs %{company_name: "some updated company_name", url: "some updated url"}
    @invalid_attrs %{company_name: nil, url: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Admin.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Admin.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Admin.create_company(@valid_attrs)
      assert company.company_name == "some company_name"
      assert company.url == "some url"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, company} = Admin.update_company(company, @update_attrs)
      assert %Company{} = company
      assert company.company_name == "some updated company_name"
      assert company.url == "some updated url"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_company(company, @invalid_attrs)
      assert company == Admin.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Admin.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Admin.change_company(company)
    end
  end

  describe "projects" do
    alias FishPot.Admin.Project

    @valid_attrs %{overview: "some overview", place: "some place", project_name: "some project_name"}
    @update_attrs %{overview: "some updated overview", place: "some updated place", project_name: "some updated project_name"}
    @invalid_attrs %{overview: nil, place: nil, project_name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Admin.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Admin.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Admin.create_project(@valid_attrs)
      assert project.overview == "some overview"
      assert project.place == "some place"
      assert project.project_name == "some project_name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Admin.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.overview == "some updated overview"
      assert project.place == "some updated place"
      assert project.project_name == "some updated project_name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_project(project, @invalid_attrs)
      assert project == Admin.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Admin.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Admin.change_project(project)
    end
  end

  describe "jobs" do
    alias FishPot.Admin.Job

    @valid_attrs %{end_date: ~N[2010-04-17 14:00:00.000000], job_name: "some job_name", start_date: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{end_date: ~N[2011-05-18 15:01:01.000000], job_name: "some updated job_name", start_date: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{end_date: nil, job_name: nil, start_date: nil}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_job()

      job
    end

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Admin.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Admin.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      assert {:ok, %Job{} = job} = Admin.create_job(@valid_attrs)
      assert job.end_date == ~N[2010-04-17 14:00:00.000000]
      assert job.job_name == "some job_name"
      assert job.start_date == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      assert {:ok, job} = Admin.update_job(job, @update_attrs)
      assert %Job{} = job
      assert job.end_date == ~N[2011-05-18 15:01:01.000000]
      assert job.job_name == "some updated job_name"
      assert job.start_date == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_job(job, @invalid_attrs)
      assert job == Admin.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Admin.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Admin.change_job(job)
    end
  end
end
