defmodule Delivery.Addresses.Neighborhood do
  use Ecto.Schema

  import Ecto.Changeset

  schema "neighborhoods" do

    field :name, :string

    timestamps()
  end

  @cast_changeset_fields ~w(
    name
  )a

  @required_changeset_fields ~w(
    name
  )a

  @doc false
  def changeset(neighborhood, attrs) do
    neighborhood
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
  end

end
