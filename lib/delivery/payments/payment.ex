defmodule Delivery.Payments.Payment do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias Delivery.Orders.Order

  schema "payments" do

    field :installments, :integer
    field :payment_type, :string
    field :status, :string
    field :transaction_amount, :integer
    field :taxes_amount, :integer
    field :shipping_cost, :integer
    field :total_paid_amount, :integer
    field :installment_amount, :integer
    field :date_approved, :utc_datetime
    field :date_created, :utc_datetime
    field :payer_id, :integer

    belongs_to :order, Order

    timestamps()
  end

  @cast_changeset_fields ~w(
    id
    installments
    payment_type
    status
    transaction_amount
    taxes_amount
    shipping_cost
    total_paid_amount
    installment_amount
    date_approved
    date_created
    payer_id
    order_id
  )a

  @required_changeset_fields ~w(
    id
    installments
    payment_type
    status
    transaction_amount
    taxes_amount
    shipping_cost
    total_paid_amount
    installment_amount
    date_approved
    date_created
    payer_id
  )a

  @money_fields [:transaction_amount, :shipping_cost, :total_paid_amount, :installment_amount]

  @doc false
  def changeset(payment, attrs) do

    attrs = convert_decimal_money_to_cents(attrs, @money_fields)

    payment
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> validate_inclusion(:payment_type, ["credit_card"])
    |> validate_inclusion(:status, ["paid"])
    |> unique_constraint(:id, name: :payments_pkey)
    |> foreign_key_constraint(:order_id)
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
