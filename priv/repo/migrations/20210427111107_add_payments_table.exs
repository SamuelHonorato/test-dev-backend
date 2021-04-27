defmodule Delivery.Repo.Migrations.AddPaymentsTable do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :installments, :integer
      add :payment_type, :string
      add :status, :string
      add :transaction_amount, :integer
      add :taxes_amount, :integer
      add :shipping_cost, :integer
      add :total_paid_amount, :integer
      add :installment_amount, :integer
      add :date_approved, :utc_datetime
      add :date_created, :utc_datetime
      add :payer_id, :integer

      add :order_id, references(:orders)

      timestamps()
    end
  end

end
