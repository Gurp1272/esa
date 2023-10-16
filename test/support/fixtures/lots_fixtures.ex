defmodule Esa.LotsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Esa.Lots` context.
  """

  @doc """
  Generate a lot.
  """
  def lot_fixture(attrs \\ %{}) do
    {:ok, lot} =
      attrs
      |> Enum.into(%{
        lot_description: "some lot_description",
        lot_number: 42,
        purchase_date: ~D[2023-10-14],
        purchase_price: "120.5"
      })
      |> Esa.Lots.create_lot()

    lot
  end

  @doc """
  Generate a lot.
  """
  def lot_fixture(attrs \\ %{}) do
    {:ok, lot} =
      attrs
      |> Enum.into(%{
        lot_description: "some lot_description",
        lot_number: 42,
        purchase_date: ~D[2023-10-15],
        purchase_price: 120.5
      })
      |> Esa.Lots.create_lot()

    lot
  end
end
