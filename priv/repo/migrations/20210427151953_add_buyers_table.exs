defmodule Delivery.Repo.Migrations.AddBuyersTable do
  use Ecto.Migration

  def change do
    create table(:buyers) do
      add :nickname, :string
      add :email, :string
      add :first_name, :string
      add :last_name, :string

      add :order_id, references(:orders)

      timestamps()
    end
  end
end
