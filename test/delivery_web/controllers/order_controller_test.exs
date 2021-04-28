defmodule DeliveryWeb.OrderControllerTest do
  use DeliveryWeb.ConnCase, async: true

  alias Delivery.Orders
  alias Delivery.Repo

  describe "create/2" do

    @tag order_controller: "create_success"
    test "return create success", %{conn: conn} do

      body =
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
          "order_items" => [%{
            "item" => %{
              "id" => "IT4801901403",
              "title" => "Produto de Testes"
            },
            "quantity" => 1,
            "unit_price" => 49.9,
            "full_unit_price" => 49.9
          }],
          "payments" => [%{
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
          }],
          "status" => "paid",
          "shipping" => %{
            "id" => 43444211797,
            "shipment_type" => "shipping",
            "date_created" => "2019-06-24T16:45:33.000-04:00",
            "receiver_address" => %{
              "id" => 1051695306,
              "address_line" => "Rua Fake de Testes 3454",
              "street_name" => "Rua Fake de Testes",
              "street_number" => "3454",
              "comment" => "teste",
              "zip_code" => "85045020",
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
          },
          "buyer" => %{
            "id" => 136226073,
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
        }

      conn =
        conn
        |> post(Routes.order_path(conn, :create), body)

      assert [order] =
        Orders.list_orders()
        |> Repo.preload([shipping: :receiver_address])
        |> Repo.preload([buyer: [:phone, :billing_info]])
        |> Repo.preload([order_items: :item])
        |> Repo.preload([:payments])

      assert conn.status == 201

      assert order.id == 9987071

      assert [order_item] = order.order_items
      assert order_item.item.id == "IT4801901403"

      assert [payment] = order.payments
      assert payment.id == 12312313

      assert order.shipping.id == 43444211797
      assert order.shipping.receiver_address.id == 1051695306

      assert order.buyer.id == 136226073
    end

  end

end
