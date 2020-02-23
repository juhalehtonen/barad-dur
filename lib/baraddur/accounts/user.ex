defmodule BaradDur.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :accesstoken, :string
    field :refreshtoken, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:accesstoken, :refreshtoken])
    |> validate_required([:accesstoken, :refreshtoken])
  end
end
