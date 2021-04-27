defmodule Delivery.Repo.Migrations.AddBillingInfosTable do
  use Ecto.Migration

  def change do
    create table(:billing_infos) do
      add :doc_type, :string
      add :doc_number, :string

      add :buyer_id, references(:buyers)

      timestamps()
    end
  end
end
