defmodule Delivery.OrderItems.OrderItem do
  use Ecto.Schema

  import Ecto.Changeset

  alias Delivery.Items.Item
  alias Delivery.Orders.Order

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
    quantity
    unit_price
    full_unit_price
  )a

  @money_fields [:unit_price, :full_unit_price]

  @doc false
  def changeset(order_item, attrs) do

    attrs = convert_decimal_money_to_cents(attrs, @money_fields)

    order_item
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> unique_constraint([:order_id, :item_id], name: :order_items_pkey)
    |> foreign_key_constraint(:order_id)
    |> foreign_key_constraint(:item_id)
    |> cast_assoc(:order)
    |> cast_assoc(:item)
  end

  def convert_decimal_money_to_cents(attrs, fields) do
    fields = fields |> Enum.map(&Atom.to_string/1)

    Enum.reduce(fields, attrs, fn field, attrs ->
      value = attrs[field]

      if is_nil(value) do
        attrs
      else
        money_in_cents = Kernel.trunc(value * 100)
        Map.put(attrs, field, money_in_cents)
      end
    end)
  end

end
