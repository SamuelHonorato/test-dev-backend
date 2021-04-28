defmodule Delivery.Orders do

  alias Delivery.Orders.Order
  alias Delivery.Services.Recruitment.OrderService

  alias Delivery.Repo

  def list_orders do
    Repo.all(Order)
  end

  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  def send_order_to_recruitment(%Order{} = order) do
    OrderService.order(order)
  end

end
