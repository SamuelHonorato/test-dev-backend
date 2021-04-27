defmodule Delivery.Addresses.State do
  use Ecto.Schema

  import Ecto.Changeset

  schema "states" do

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
  def changeset(state, attrs) do
    state
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
  end

end
