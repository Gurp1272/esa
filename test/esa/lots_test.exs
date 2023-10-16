defmodule Esa.LotsTest do
  use Esa.DataCase

  alias Esa.Lots

  describe "lots" do
    alias Esa.Lots.Lot

    import Esa.LotsFixtures

    @invalid_attrs %{lot_number: nil, purchase_date: nil, purchase_price: nil, lot_description: nil}

    test "list_lots/0 returns all lots" do
      lot = lot_fixture()
      assert Lots.list_lots() == [lot]
    end

    test "get_lot!/1 returns the lot with given id" do
      lot = lot_fixture()
      assert Lots.get_lot!(lot.id) == lot
    end

    test "create_lot/1 with valid data creates a lot" do
      valid_attrs = %{lot_number: 42, purchase_date: ~D[2023-10-15], purchase_price: 120.5, lot_description: "some lot_description"}

      assert {:ok, %Lot{} = lot} = Lots.create_lot(valid_attrs)
      assert lot.lot_number == 42
      assert lot.purchase_date == ~D[2023-10-15]
      assert lot.purchase_price == 120.5
      assert lot.lot_description == "some lot_description"
    end

    test "create_lot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lots.create_lot(@invalid_attrs)
    end

    test "update_lot/2 with valid data updates the lot" do
      lot = lot_fixture()
      update_attrs = %{lot_number: 43, purchase_date: ~D[2023-10-16], purchase_price: 456.7, lot_description: "some updated lot_description"}

      assert {:ok, %Lot{} = lot} = Lots.update_lot(lot, update_attrs)
      assert lot.lot_number == 43
      assert lot.purchase_date == ~D[2023-10-16]
      assert lot.purchase_price == 456.7
      assert lot.lot_description == "some updated lot_description"
    end

    test "update_lot/2 with invalid data returns error changeset" do
      lot = lot_fixture()
      assert {:error, %Ecto.Changeset{}} = Lots.update_lot(lot, @invalid_attrs)
      assert lot == Lots.get_lot!(lot.id)
    end

    test "delete_lot/1 deletes the lot" do
      lot = lot_fixture()
      assert {:ok, %Lot{}} = Lots.delete_lot(lot)
      assert_raise Ecto.NoResultsError, fn -> Lots.get_lot!(lot.id) end
    end

    test "change_lot/1 returns a lot changeset" do
      lot = lot_fixture()
      assert %Ecto.Changeset{} = Lots.change_lot(lot)
    end
  end
end
