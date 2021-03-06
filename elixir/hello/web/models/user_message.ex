defmodule Hello.UserMessage do
  use Hello.Web, :model

  schema "user_messages" do
    field :title, :string
    field :body, :string
    belongs_to :user, Hello.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end
end
