defmodule Delivery.Repo.Migrations.AddOrderItemsTable do
  use Ecto.Migration

  def change do
    create table(:order_items, primary_key: false) do

      add :quantity, :integer
      add :unit_price, :integer
      add :full_unit_price, :integer

      add :order_id, references(:orders), primary_key: true
      add :item_id, references(:items, type: :string), primary_key: true

      timestamps()
    end
  end
end
