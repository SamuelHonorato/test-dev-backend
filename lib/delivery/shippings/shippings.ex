defmodule Delivery.Shippings do

  alias Delivery.Shippings.Shipping
  alias Delivery.Repo

  def create_shipping(attrs \\ %{}) do
    %Shipping{}
    |> Shipping.changeset(attrs)
    |> Repo.insert()
  end

end
