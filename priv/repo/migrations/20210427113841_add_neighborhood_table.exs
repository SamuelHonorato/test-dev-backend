defmodule Delivery.Repo.Migrations.AddNeighborhoodTable do
  use Ecto.Migration

  def change do
    create table(:neighborhoods) do
      add :name, :string

      timestamps()
    end
  end
end
