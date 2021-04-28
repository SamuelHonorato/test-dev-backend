defmodule DeliveryWeb.OrderViewTest do
  use DeliveryWeb.ConnCase, async: true

  alias Delivery.Orders.Order
  alias DeliveryWeb.OrderView

  setup do

    %{order: %Order{id: 1}}
  end

  @tag order_view: "create_success"
  test "return create order", %{order: order} do
    response = OrderView.render("create.json", %{order: order})

    assert %{data: %{id: id}} = response
    assert id == order.id
  end

end
