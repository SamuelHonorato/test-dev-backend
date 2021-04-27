defmodule Delivery.Orders.Order do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

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
  )a

  @money_fields [:total_amount, :total_shipping, :total_amount_with_shipping, :paid_amount]

  @doc false
  def changeset(order, attrs) do

    attrs = convert_decimal_money_to_cents(attrs, @money_fields)

    order
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> unique_constraint(:id, name: :orders_pkey)
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
