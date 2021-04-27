defmodule Delivery.Addresses.City do
  use Ecto.Schema

  import Ecto.Changeset

  schema "cities" do

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
  def changeset(city, attrs) do
    city
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
  end

end
