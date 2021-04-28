defmodule Delivery.Services.Recruitment.OrderService do
  use Tesla

  import Helpers.ServiceHelper
  import Delivery.Services.Recruitment.Config
  import Delivery.Services.Recruitment.OrderView

  plug Tesla.Middleware.BaseUrl, get_base_url(:api)
  plug Tesla.Middleware.Headers, [x_sent_header()]
  plug Tesla.Middleware.JSON

  @success 200

  def order(params) do
    request_body = render("order.request", params)

    response =
      "/"
      |> post(request_body)
      |> IO.inspect
      |> handle_response()

    case response do
      {:ok, @success, body} -> {:ok, render("order.response.success", body)}
      _ -> {:error, :order, :unmapped_response}
    end
  end

end
