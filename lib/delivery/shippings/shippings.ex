defmodule Delivery.Shippings do

  alias Delivery.Repo
  alias Delivery.Shippings.Shipping

  def create_shipping(attrs \\ %{}) do
    %Shipping{}
    |> Shipping.changeset(attrs)
    |> Repo.insert()
  end

end
