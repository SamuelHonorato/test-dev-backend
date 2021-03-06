defmodule DeliveryWeb.OrderView do
  use DeliveryWeb, :view

  def render("create.json", %{order: order}) do
    data = %{id: order.id}
    %{data: data}
  end

  def render("show.json", %{order: order}) do
    data = render_one(order, __MODULE__, "order.json", as: :order)
    %{data: data}
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      store_id: order.store_id
    }
  end
end
