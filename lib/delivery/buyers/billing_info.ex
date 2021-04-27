defmodule Delivery.Buyers.BillingInfo do
  use Ecto.Schema

  import Ecto.Changeset

  alias Delivery.Buyers.Buyer

  schema "billing_infos" do

    field :doc_type, :string
    field :doc_number, :string

    belongs_to :buyer, Buyer

    timestamps()
  end

  @cast_changeset_fields ~w(
    doc_type
    doc_number
    buyer_id
  )a

  @required_changeset_fields ~w(
    doc_type
    doc_number
  )a

  @doc false
  def changeset(billing_info, attrs) do
    billing_info
    |> cast(attrs, @cast_changeset_fields)
    |> validate_required(@required_changeset_fields)
    |> validate_inclusion(:doc_type, ["CPF"])
    |> foreign_key_constraint(:buyer_id)
  end

end
