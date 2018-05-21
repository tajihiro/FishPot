defmodule FishPot.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :company_name, :string, size: 60, null: false
      add :url, :string, size: 120

      timestamps()
    end

  end
end
