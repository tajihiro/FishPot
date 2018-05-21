defmodule FishPot.Admin.Worker do
  use Ecto.Schema
  import Ecto.Changeset


  schema "workers" do
    field :first_kn_name, :string
    field :first_name, :string
    field :last_kn_name, :string
    field :last_name, :string
    field :gender_cd, :integer
    field :email, :string
    field :tel, :string
    field :address, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(worker, attrs) do
    worker
    |> cast(attrs, [:last_name, :first_name, :last_kn_name, :first_kn_name, :email, :user_id, :gender_cd, :tel, :address])
    |> validate_required([:last_name, :first_name, :last_kn_name, :first_kn_name, :email, :user_id, :gender_cd, :tel])
  end
end
