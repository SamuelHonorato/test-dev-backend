defmodule Playground do

  alias Delivery.{Addresses, Buyers, Items, Orders, OrderItems, Shippings, Payments}

  def run() do
    url = Application.get_env(:delivery, :mongo_db)[:url]

    {:ok, conn} = Mongo.start_link(url: "mongodb://delivery_mongo:27017/test")

    cursor = Mongo.find(conn, "products", %{})

    cursor
    |> Enum.to_list()
    |> IO.inspect
  end

  def create_order() do
    Orders.create_order(order())
  end

  def order() do
    %{
      "id" => 9987071,
      "store_id" => 282,
      "date_created" => "2019-06-24T16:45:32.000-04:00",
      "date_closed" => "2019-06-24T16:45:35.000-04:00",
      "last_updated" => "2019-06-25T13:26:49.000-04:00",
      "total_amount" => 49.9,
      "total_shipping" => 5.14,
      "total_amount_with_shipping" => 55.04,
      "paid_amount" => 55.04,
      "expiration_date" => "2019-07-22T16:45:35.000-04:00",
      "status" => "paid"
    }
  end

  def create_item() do
    Items.create_item(item())
  end

  def item() do
    %{
      "id" => "IT4801901403",
      "title" => "Produto de Testes"
    }
  end

  def create_order_item() do
    OrderItems.create_order_item(order_item())
  end

  def order_item() do
    %{
      "quantity" => 1,
      "unit_price" => 4990,
      "full_unit_price" => 4990,
      "order_id" => 9987071,
      "item_id" => "IT4801901403",
    }
  end

  def create_payment() do
    Payments.create_payment(payment())
  end

  def payment() do
    %{
      "id" => 12312313,
      "order_id" => 9987071,
      "payer_id" => 414138,
      "installments" => 1,
      "payment_type" => "credit_card",
      "status" => "paid",
      "transaction_amount" => 49.9,
      "taxes_amount" => 0,
      "shipping_cost" => 5.14,
      "total_paid_amount" => 55.04,
      "installment_amount" => 55.04,
      "date_approved" => "2019-06-24T16:45:35.000-04:00",
      "date_created" => "2019-06-24T16:45:33.000-04:00"
    }
  end

  def create_shipping() do
    Shippings.create_shipping(shipping())
  end

  def shipping() do
    %{
      "id" => 43444211797,
      "shipment_type" => "shipping",
      "date_created" => "2019-06-24T16:45:33.000-04:00",
      "order_id" => 9987071
    }
  end

  def create_address() do
    Addresses.create_address(address())
  end

  def address() do
    %{
      "id" => 1051695306,
      "address_line" => "Rua Fake de Testes 3454",
      "street_name" => "Rua Fake de Testes",
      "street_number" => "3454",
      "comment" => "teste",
      "zip_code" => "85045020",
      "shipping_id" => 43444211797,
      "city" => %{
        "name" => "Cidade de Testes"
      },
      "state" => %{
        "name" => "São Paulo"
      },
      "country" => %{
        "id" => "BR",
        "name" => "Brasil"
      },
      "neighborhood" => %{
        "id" => nil,
        "name" => "Vila de Testes"
      },
      "latitude" => -23.629037,
      "longitude" => -46.712689,
      "receiver_phone" => "41999999999"
    }
  end

  def create_buyer() do
    Buyers.create_buyer(buyer())
  end

  def buyer() do
    %{
      "id" => 136226073,
      "order_id" => 9987071,
      "nickname" => "JOHN DOE",
      "email" => "john@doe.com",
      "phone" => %{
        "area_code" => 41,
        "number" => "999999999"
      },
      "first_name" => "John",
      "last_name" => "Doe",
      "billing_info" => %{
        "doc_type" => "CPF",
        "doc_number" => "09487965477"
      }
    }
  end
end

Playground.run()






















