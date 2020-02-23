defmodule BaradDur.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :accesstoken, :string
      add :refreshtoken, :string

      timestamps()
    end

  end
end
