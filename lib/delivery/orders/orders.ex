defmodule Delivery.Orders do

  alias Delivery.Orders.Order
  alias Delivery.Repo

  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

end
