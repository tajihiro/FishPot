defmodule FishPot.Admin.Company do
  use Ecto.Schema
  import Ecto.Changeset


  schema "companies" do
    field :company_name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:company_name, :url])
    |> validate_required([:company_name, :url])
  end
end
