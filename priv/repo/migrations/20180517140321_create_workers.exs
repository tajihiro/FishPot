defmodule FishPot.Repo.Migrations.CreateWorkers do
  use Ecto.Migration

  def change do
    create table(:workers) do
      add :user_id, references(:users, on_delete: :nothing)
      add :last_name, :string, size: 20, null: false
      add :first_name, :string, size: 20, null: false
      add :last_kn_name, :string, size: 20
      add :first_kn_name, :string, size: 20
      add :gender_cd, :integer, size: 1, null: false, default: 0
      add :birthday, :date
      add :email, :string, size: 120, null: false
      add :tel, :string, size: 20
      add :address, :string, size: 120

      timestamps()
    end

    create index(:workers, [:user_id])
  end
end
