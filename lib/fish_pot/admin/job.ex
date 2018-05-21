defmodule FishPot.Admin.Job do
  use Ecto.Schema
  import Ecto.Changeset


  schema "jobs" do
    field :end_date, :date
    field :job_name, :string
    field :start_date, :date
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:job_name, :start_date, :end_date])
    |> validate_required([:job_name, :start_date, :end_date])
  end
end
