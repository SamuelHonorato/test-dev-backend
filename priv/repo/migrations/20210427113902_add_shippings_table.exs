defmodule Delivery.Repo.Migrations.AddShippingTable do
  use Ecto.Migration

  def change do
    create table(:shippings) do

      add :shipment_type, :string
      add :date_created, :utc_datetime

      add :order_id, references(:orders)

      timestamps()
    end
  end
end
