defmodule DeliveryWeb.OrderController do
  use DeliveryWeb, :controller

  alias Delivery.Orders

  def show(conn, params) do
    id = params["id"]

    with {:ok, order} <- Orders.get_order(id) do

      success(conn)
      |> render("show.json", %{order: order})
    else
      :order_not_found ->
        not_found(conn)
    end
  end

  def create(conn, params) do

    with {:ok, order} <- Orders.create_order(params) do
#         {:ok, _response_body} <- Orders.send_order_to_recruitment(order) do

      conn
      |> created()
      |> render("create.json", %{order: order})
    else
      {:error, :bad_request, body} ->
        conn
        |> bad_request()
        |> json(%{error: body})
      {:error, changeset} ->
        errors = ChangesetHelper.format_error(changeset)

        conn
        |> unprocessable_entity()
        |> json(%{error: errors})
      _ ->
        internal_server_error(conn)
    end

  end

end
