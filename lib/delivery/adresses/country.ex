defmodule Delivery.Addresses.Country do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}

  schema "countries" do

    field :name, :string

    timestamps()
  end

  @cast_changeset_fields ~w(
    id
    name
  )a

  @required_changeset_fields ~w(
    id
    name
  )a

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> unique_constraint(:id, name: :countries_pkey)
  end

end
