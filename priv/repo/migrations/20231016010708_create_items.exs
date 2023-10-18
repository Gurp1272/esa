defmodule Esa.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :listed_date, :date
      add :listing_link, :string
      add :stock_location, :string
      add :item_price, :float
      add :listing_status, :string
      add :sold_gross, :float
      add :sold_net, :float
      add :lot_id, references(:lots)

      timestamps(type: :utc_datetime)
    end
  end
end
