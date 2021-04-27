defmodule Delivery.Items do

  alias Delivery.Items.Item
  alias Delivery.Repo

  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

end
