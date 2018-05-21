defmodule FishPot.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :project_name, :string, size: 100, null: false
      add :overview, :string, size: 250
      add :work_place, :string, size: 60
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps()
    end

    create index(:projects, [:company_id])
  end
end
