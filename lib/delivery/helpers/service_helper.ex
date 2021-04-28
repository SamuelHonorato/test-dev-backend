defmodule Helpers.ServiceHelper do

  @success 200

  def handle_response({:ok, %Tesla.Env{status: @success, body: body}}), do: {:ok, @success, decode_body(body)}
  def handle_response({:ok, %Tesla.Env{status: status, body: body}}), do: {:error, status, decode_body(body)}
  def handle_response({:error, :econnrefused}), do: {:error, :failed_to_connect}

  defp decode_body(body) when is_map(body), do: body

  defp decode_body(body) when is_binary(body) do
    case Poison.decode(body) do
      {:ok, body_map} -> body_map
      _ -> body
    end
  end

  defp decode_body(body), do: body

end
