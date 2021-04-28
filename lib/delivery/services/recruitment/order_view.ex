defmodule Delivery.Services.Recruitment.OrderView do

  alias Delivery.Addresses.Address
  alias Delivery.Buyers.Buyer
  alias Delivery.Payments.Payment
  alias Delivery.OrderItems.OrderItem
  alias Delivery.Orders.Order

  def render("order.request", %Order{} = params) do
    format_order(params)
  end
  def render("order.response.success", params) do
    params
  end

  def format_order(%Order{} = order) do
    %{
      "externalCode" => order.id,
      "storeId" => order.store_id,
      "subTotal" => order.total_amount/100,
      "deliveryFee" => order.total_shipping/100,
      "total" => order.total_amount_with_shipping/100,
      "dtOrderCreate" => order.date_created,
      "customer" => format_customer(order.buyer),
      "items" => Enum.map(order.order_items, &format_order_item/1),
      "payments" => Enum.map(order.payments, &format_payment/1)
    }
  end

  def format_customer(%Buyer{} = buyer) do
    %{
      "externalCode" => buyer.id,
      "name" => "#{buyer.first_name} #{buyer.last_name}",
      "email" => buyer.email,
      "contact" => "#{buyer.phone.area_code}#{buyer.phone.number}"
    }
  end

  def format_payment(%Payment{} = payment) do
    %{
      "type" => payment.payment_type,
      "value" => payment.total_paid_amount/100
    }
  end

  def format_order_item(%OrderItem{} = order_item) do
    %{
      "externalCode" => order_item.item.id,
      "name" => order_item.item.title,
      "price" => order_item.full_unit_price/100,
      "quantity" => order_item.quantity,
      "total" => order_item.full_unit_price/100,
      "subItems" => []
    }
  end

  def format_address(%Address{} = address) do
    %{
      "country" => address.country.id,
      "state" => address.state.id,
      "city" => address.city.name,
      "district" => address.neighborhood.name,
      "street" => address.street_name,
      "complement" => address.comment,
      "latitude" => address.latitude,
      "longitude" => address.longitude,
      "postalCode" => address.zip_code,
      "number" => address.street_number,
    }
  end

end
