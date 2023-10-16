defmodule Esa.ItemsTest do
  use Esa.DataCase

  alias Esa.Items

  describe "items" do
    alias Esa.Items.Item

    import Esa.ItemsFixtures

    @invalid_attrs %{listed_date: nil, listing_link: nil, stock_location: nil, item_price: nil, listing_status: nil, sold_gross: nil, sold_net: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Items.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Items.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{listed_date: ~D[2023-10-15], listing_link: "some listing_link", stock_location: "some stock_location", item_price: 120.5, listing_status: "some listing_status", sold_gross: 120.5, sold_net: 120.5}

      assert {:ok, %Item{} = item} = Items.create_item(valid_attrs)
      assert item.listed_date == ~D[2023-10-15]
      assert item.listing_link == "some listing_link"
      assert item.stock_location == "some stock_location"
      assert item.item_price == 120.5
      assert item.listing_status == "some listing_status"
      assert item.sold_gross == 120.5
      assert item.sold_net == 120.5
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{listed_date: ~D[2023-10-16], listing_link: "some updated listing_link", stock_location: "some updated stock_location", item_price: 456.7, listing_status: "some updated listing_status", sold_gross: 456.7, sold_net: 456.7}

      assert {:ok, %Item{} = item} = Items.update_item(item, update_attrs)
      assert item.listed_date == ~D[2023-10-16]
      assert item.listing_link == "some updated listing_link"
      assert item.stock_location == "some updated stock_location"
      assert item.item_price == 456.7
      assert item.listing_status == "some updated listing_status"
      assert item.sold_gross == 456.7
      assert item.sold_net == 456.7
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_item(item, @invalid_attrs)
      assert item == Items.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Items.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Items.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Items.change_item(item)
    end
  end
end
