defmodule DeliveryWeb.OrderController do
  use DeliveryWeb, :controller

  import Helpers.ConnHelper, only: [created: 1, unprocessable_entity: 1, bad_request: 1, internal_server_error: 1]

  alias Delivery.Orders

  def create(conn, params) do

    with {:ok, order} <- Orders.create_order(params),
         {:ok, _response_body} <- Orders.send_order_to_recruitment(order) do

      conn
      |> created()
      |> render("create.json", %{order: order})
    else
      {:error, :bad_request, body} ->
        conn
        |> bad_request()
        |> json(%{error: body})
      {:error, changeset} ->
        unprocessable_entity(conn)
      _ ->
        internal_server_error(conn)
    end

  end

end
