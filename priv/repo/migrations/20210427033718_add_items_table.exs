defmodule Delivery.Repo.Migrations.AddItemsTable do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :string, primary_key: true
      add :title, :string

      timestamps()
    end
  end
end
