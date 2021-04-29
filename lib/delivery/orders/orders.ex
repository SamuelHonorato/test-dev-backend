defmodule Delivery.Orders do

  alias Delivery.Orders.Order
  alias Delivery.Services.Recruitment.OrderService

  alias Delivery.Repo

  def list_orders do
    Repo.all(Order)
  end

  def get_order(id) do
    order = get_order!(id)
    if is_nil(order), do: :order_not_found, else: {:ok, order}
  end

  def get_order!(id) do
    Order.query_main
    |> Order.where_id(id)
    |> Repo.one
  end

  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  def send_order_to_recruitment(%Order{} = order) do
    case OrderService.create_order(order) do
      {:ok, body} -> {:ok, body}
      {:error, :bad_request, body} -> {:error, :bad_request, body}
      {:error, :order, :unmapped_response} -> :error
    end
  end

end
