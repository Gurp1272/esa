defmodule Esa.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Esa.Items` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        item_price: 120.5,
        listed_date: ~D[2023-10-15],
        listing_link: "some listing_link",
        listing_status: "some listing_status",
        sold_gross: 120.5,
        sold_net: 120.5,
        stock_location: "some stock_location"
      })
      |> Esa.Items.create_item()

    item
  end
end
