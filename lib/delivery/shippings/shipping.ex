defmodule Delivery.Shippings.Shipping do
  use Ecto.Schema

  import Ecto.Changeset

  alias Delivery.Addresses.Address
  alias Delivery.Orders.Order

  schema "shippings" do

    field :shipment_type, :string
    field :date_created, :utc_datetime

    belongs_to :order, Order

    has_one :receiver_address, Address

    timestamps()
  end

  @cast_changeset_fields ~w(
    id
    shipment_type
    date_created
    order_id
  )a

  @required_changeset_fields ~w(
    id
    shipment_type
    date_created
  )a

  @doc false
  def changeset(shipping, attrs) do
    shipping
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> validate_inclusion(:shipment_type, ["shipping"])
    |> foreign_key_constraint(:order_id)
    |> unique_constraint(:id, name: :shippings_pkey)
    |> cast_assoc(:receiver_address)
  end

end
