defmodule Delivery.Repo.Migrations.AddPhonesTable do
  use Ecto.Migration

  def change do
    create table(:phones) do
      add :area_code, :integer
      add :number, :string

      add :buyer_id, references(:buyers)

      timestamps()
    end
  end
end
