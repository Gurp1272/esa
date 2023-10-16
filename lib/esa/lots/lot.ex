defmodule Esa.Lots.Lot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lots" do
    field :lot_number, :integer
    field :purchase_date, :date
    field :purchase_price, :float
    field :lot_description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(lot, attrs) do
    lot
    |> cast(attrs, [:lot_number, :purchase_date, :purchase_price, :lot_description])
    |> validate_required([:lot_number, :purchase_date, :purchase_price, :lot_description])
  end
end
