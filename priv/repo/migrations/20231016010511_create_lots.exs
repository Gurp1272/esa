defmodule Esa.Repo.Migrations.CreateLots do
  use Ecto.Migration

  def change do
    create table(:lots) do
      add :lot_number, :integer
      add :purchase_date, :date
      add :purchase_price, :float
      add :lot_description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
