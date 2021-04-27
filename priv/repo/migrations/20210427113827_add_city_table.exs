defmodule Delivery.Repo.Migrations.AddCityTable do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string

      timestamps()
    end
  end
end
