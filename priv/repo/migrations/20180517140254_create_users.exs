defmodule FishPot.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :last_name, :string, size: 20, null: false
      add :first_name, :string, size: 20, null: false
      add :last_kn_name, :string, size: 20
      add :first_kn_name, :string, size: 20
      add :gender_cd, :integer, size: 1, null: false, default: 0
      add :email, :string, size: 120, null: false
      add :tel, :string, size: 20
      add :passwd, :string, size: 10, null: false

      timestamps()
    end

  end
end
