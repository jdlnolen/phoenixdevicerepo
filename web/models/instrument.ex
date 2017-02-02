defmodule Device.Instrument do
  use Device.Web, :model

  schema "instruments" do
    field :name, :string
    field :value, :decimal

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :value])
    |> validate_required([:name, :value])
  end
end
