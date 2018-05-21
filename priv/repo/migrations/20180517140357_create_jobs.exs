defmodule FishPot.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :job_name, :string, size: 20, null: false
      add :overview, :string, size: 250
      add :start_date, :date
      add :end_date, :date
      add :manager_name, :string, size: 40
      add :email, :string, size: 120
      add :tel, :string, size: 120
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:jobs, [:project_id])
  end
end
