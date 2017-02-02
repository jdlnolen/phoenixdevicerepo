defmodule Device.Repo.Migrations.CreateInstrument do
  use Ecto.Migration

  def change do
    create table(:instruments) do
      add :name, :string
      add :value, :decimal

      timestamps()
    end

  end
end
