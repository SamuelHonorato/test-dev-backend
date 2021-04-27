defmodule Delivery.Repo.Migrations.AddCountryTable do
  use Ecto.Migration

  def change do
    create table(:countries, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string

      timestamps()
    end
  end
end
