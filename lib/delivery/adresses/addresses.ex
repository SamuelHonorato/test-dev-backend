defmodule Delivery.Addresses do

  alias Delivery.Addresses.Address
  alias Delivery.Repo

  def create_address(attrs \\ %{}) do
    %Address{}
    |> Address.changeset(attrs)
    |> Repo.insert()
  end

end
