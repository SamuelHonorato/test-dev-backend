defmodule Delivery.OrderItems do

  alias Delivery.OrderItems.OrderItem
  alias Delivery.Repo

  def create_order_item(attrs \\ %{}) do
    %OrderItem{}
    |> OrderItem.changeset(attrs)
    |> Repo.insert()
  end

end
