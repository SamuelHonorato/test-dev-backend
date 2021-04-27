defmodule Delivery.Repo.Migrations.AddAddressTable do
  use Ecto.Migration

  def change do
    create table(:adresses) do
      add :address_line, :string
      add :street_name, :string
      add :street_number, :string
      add :comment, :text
      add :zip_code, :string
      add :latitude, :float
      add :longitude, :float
      add :receiver_phone, :string

      add :neighborhood_id, references(:neighborhoods)
      add :city_id, references(:cities)
      add :state_id, references(:states)
      add :country_id, references(:countries, type: :string)

      timestamps()
    end
  end
end
