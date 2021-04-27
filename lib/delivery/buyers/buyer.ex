defmodule Delivery.Buyers.Buyer do
  use Ecto.Schema

  import Ecto.Changeset

  alias Delivery.Orders.Order
  alias Delivery.Buyers.{BillingInfo, Phone}

  schema "buyers" do

    field :nickname, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    belongs_to :order, Order

    has_one :phone, Phone
    has_one :billing_info, BillingInfo

    timestamps()
  end

  @cast_changeset_fields ~w(
    id
    nickname
    email
    first_name
    last_name
    order_id
  )a

  @required_changeset_fields ~w(
    id
    nickname
    email
    first_name
    last_name
  )a

  @doc false
  def changeset(buyer, attrs) do
    buyer
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> unique_constraint(:id, name: :buyers_pkey)
    |> foreign_key_constraint(:order_id)
    |> cast_assoc(:phone)
    |> cast_assoc(:billing_info)
  end

end
