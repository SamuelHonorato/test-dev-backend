defmodule Delivery.Buyers.Phone do
  use Ecto.Schema

  import Ecto.Changeset

  alias Delivery.Buyers.Buyer

  schema "phones" do

    field :area_code, :integer
    field :number, :string

    belongs_to :buyer, Buyer

    timestamps()
  end

  @cast_changeset_fields ~w(
    area_code
    number
    buyer_id
  )a

  @required_changeset_fields ~w(
    area_code
    number
  )a

  @doc false
  def changeset(phone, attrs) do
    phone
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> foreign_key_constraint(:buyer_id)
  end

end
