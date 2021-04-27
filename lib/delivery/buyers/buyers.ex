defmodule Delivery.Buyers do

  alias Delivery.Buyers.Buyer
  alias Delivery.Repo

  def create_buyer(attrs \\ %{}) do
    %Buyer{}
    |> Buyer.changeset(attrs)
    |> Repo.insert()
  end

end
