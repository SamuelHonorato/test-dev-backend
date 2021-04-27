defmodule Delivery.Addresses.Address do
  use Ecto.Schema

  import Ecto.Changeset

  alias Delivery.Addresses.{Country, City, Neighborhood, State}
  alias Delivery.Shippings.Shipping

  schema "addresses" do

    field :address_line, :string
    field :street_name, :string
    field :street_number, :string
    field :comment, :string
    field :zip_code, :string
    field :latitude, :float
    field :longitude, :float
    field :receiver_phone, :string

    belongs_to :shipping, Shipping
    belongs_to :neighborhood, Neighborhood
    belongs_to :city, City
    belongs_to :state, State
    belongs_to :country, Country, type: :string

    timestamps()
  end

  @cast_changeset_fields ~w(
    address_line
    street_name
    street_number
    comment
    zip_code
    latitude
    longitude
    receiver_phone
    shipping_id
    neighborhood_id
    city_id
    state_id
    country_id
  )a

  @required_changeset_fields ~w(
    address_line
    street_name
    street_number
    comment
    zip_code
    latitude
    longitude
    receiver_phone
  )a

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> cast_assoc(:neighborhood)
    |> cast_assoc(:city)
    |> cast_assoc(:state)
    |> cast_assoc(:country)
  end

end
