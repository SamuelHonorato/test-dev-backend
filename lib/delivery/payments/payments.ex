defmodule Delivery.Payments do

  alias Delivery.Payments.Payment
  alias Delivery.Repo

  def create_payment(attrs \\ %{}) do
    %Payment{}
    |> Payment.changeset(attrs)
    |> Repo.insert()
  end

end
