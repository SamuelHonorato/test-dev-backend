defmodule Delivery.Repo.Migrations.AddOrdersTable do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :store_id, :integer
      add :date_created, :utc_datetime
      add :date_closed, :utc_datetime
      add :last_updated, :utc_datetime
      add :total_amount, :integer
      add :total_shipping, :integer
      add :total_amount_with_shipping, :integer
      add :paid_amount, :integer
      add :expiration_date, :utc_datetime
      add :status, :string

      timestamps()
    end

    create index(:orders, :store_id)
  end
end
