defmodule Delivery.Orders.Order do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias Delivery.Buyers.Buyer
  alias Delivery.OrderItems.OrderItem
  alias Delivery.Payments.Payment
  alias Delivery.Shippings.Shipping

  schema "orders" do

    field :store_id, :integer
    field :date_created, :utc_datetime
    field :date_closed, :utc_datetime
    field :last_updated, :utc_datetime
    field :total_amount, :integer
    field :total_shipping, :integer
    field :total_amount_with_shipping, :integer
    field :paid_amount, :integer
    field :expiration_date, :utc_datetime
    field :status, :string

    has_one :shipping, Shipping
    has_one :buyer, Buyer

    has_many :order_items, OrderItem
    has_many :payments, Payment

    timestamps()
  end

  @cast_changeset_fields ~w(
    id
    store_id
    date_created
    date_closed
    last_updated
    total_amount
    total_shipping
    total_amount_with_shipping
    paid_amount
    expiration_date
    status
  )a

  @required_changeset_fields ~w(
    id
    store_id
    date_created
    date_closed
    last_updated
    total_amount
    total_shipping
    total_amount_with_shipping
    paid_amount
    expiration_date
    status
  )a

  @money_fields [:total_amount, :total_shipping, :total_amount_with_shipping, :paid_amount]

  @doc false
  def changeset(order, attrs) do

    attrs = convert_decimal_money_to_cents(attrs, @money_fields)

    order
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> validate_inclusion(:status, ["paid"])
    |> unique_constraint(:id, name: :orders_pkey)
    |> cast_assoc(:shipping, required: true)
    |> cast_assoc(:buyer, required: true)
    |> cast_assoc(:order_items, required: true)
    |> cast_assoc(:payments, required: true)
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

  @doc false

  def query_main, do: from(order in __MODULE__, as: :order)

  def where_id(query, id), do: from([order: order] in query, where: order.id == ^id)

end
