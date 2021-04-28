defmodule DeliveryWeb.OrderController do
  use DeliveryWeb, :controller

  import Helpers.ConnHelper, only: [created: 1, unprocessable_entity: 1]

  alias Delivery.Orders

  def create(conn, params) do

    with {:ok, order} <- Orders.create_order(params) do
      conn
      |> created()
      |> render("create.json", %{order: order})
    else
      _ -> unprocessable_entity(conn)
    end

  end

end
