defmodule FishPot.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_kn_name, :string
    field :first_name, :string
    field :last_kn_name, :string
    field :last_name, :string
    field :gender_cd, :integer
    field :email, :string
    field :tel, :string
    field :passwd, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:last_name, :first_name, :last_kn_name, :first_kn_name, :email, :passwd, :tel, :gender_cd])
    |> validate_required([:last_name, :first_name, :last_kn_name, :first_kn_name, :email, :passwd, :gender_cd])
  end
end
