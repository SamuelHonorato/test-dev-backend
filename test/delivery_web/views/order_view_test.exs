defmodule DeliveryWeb.OrderViewTest do
  use DeliveryWeb.ConnCase, async: true

  alias Delivery.Orders.Order
  alias DeliveryWeb.OrderView

  setup do

    %{order: %Order{id: 1, store_id: 2}}
  end

  @tag order_view: "create_success"
  test "return create order", %{order: order} do
    response = OrderView.render("create.json", %{order: order})

    assert %{data: %{id: id}} = response
    assert id == order.id
  end

  @tag order_view: "show_success"
  test "return show order", %{order: order} do
    response = OrderView.render("show.json", %{order: order})

    assert %{data: %{id: id, store_id: store_id}} = response
    assert id == order.id
    assert store_id == order.store_id
  end

end
