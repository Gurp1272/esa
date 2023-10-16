defmodule Esa.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :listed_date, :date
    field :listing_link, :string
    field :stock_location, :string
    field :item_price, :float
    field :listing_status, :string
    field :sold_gross, :float
    field :sold_net, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:listed_date, :listing_link, :stock_location, :item_price, :listing_status, :sold_gross, :sold_net])
    |> validate_required([:listed_date, :listing_link, :stock_location, :item_price, :listing_status, :sold_gross, :sold_net])
  end
end
