defmodule Delivery.Items.Item do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  @primary_key {:id, :string, autogenerate: false}

  schema "items" do

    field :title, :string

    timestamps()
  end

  @cast_changeset_fields ~w(
    id
    title
  )a

  @required_changeset_fields ~w(
    id
    title
  )a

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> unique_constraint(:id, name: :items_pkey)
  end

end
