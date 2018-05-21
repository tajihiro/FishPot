defmodule FishPot.Admin.Project do
  use Ecto.Schema
  import Ecto.Changeset


  schema "projects" do
    field :project_name, :string
    field :overview, :string
    field :work_place, :string
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:project_name, :overview, :work_place])
    |> validate_required([:project_name, :overview, :work_place])
  end
end
