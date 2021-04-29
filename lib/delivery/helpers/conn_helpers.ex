defmodule Helpers.ConnHelper do

  import Plug.Conn

  @content_type "application/json"

  @created_status_code 201
  @bad_request_status_code 400
  @unprocessable_entity_status_code 422
  @internal_server_error_status_code 500

  def created(conn) do
    conn
    |> put_resp_content_type(@content_type)
    |> put_status(@created_status_code)
  end

  def bad_request(conn) do
    conn
    |> put_resp_content_type(@content_type)
    |> put_status(@bad_request_status_code)
  end

  def unprocessable_entity(conn) do
    conn
    |> put_resp_content_type(@content_type)
    |> put_status(@unprocessable_entity_status_code)
  end

  def internal_server_error(conn) do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(@internal_server_error_status_code, "Erro Interno do Servidor")
    |> halt()
  end

end
