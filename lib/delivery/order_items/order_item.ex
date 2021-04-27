defmodule Delivery.OrderItems.OrderItem do
  use Ecto.Schema

  import Ecto.Changeset

  alias Delivery.Orders.Order
  alias Delivery.Items.Item

  @primary_key false

  schema "order_items" do

    field :quantity, :integer
    field :unit_price, :integer
    field :full_unit_price, :integer

    belongs_to :order, Order, primary_key: true
    belongs_to :item, Item, type: :string, primary_key: true

    timestamps()
  end

  @cast_changeset_fields ~w(
    order_id
    item_id
    quantity
    unit_price
    full_unit_price
  )a

  @required_changeset_fields ~w(
    order_id
    item_id
    quantity
    unit_price
    full_unit_price
  )a

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> unique_constraint([:order_id, :item_id], name: :order_items_pkey)
    |> foreign_key_constraint(:order_id)
    |> foreign_key_constraint(:item_id)
  end

end
