defmodule Helpers.ConnHelper do

  import Plug.Conn

  @content_type "application/json"

  @created_status_code 201
  @unprocessable_entity_status_code 422

  def created(conn) do
    conn
    |> put_resp_content_type(@content_type)
    |> put_status(@created_status_code)
  end

  def unprocessable_entity(conn) do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(@unprocessable_entity_status_code, "")
    |> halt()
  end

end
