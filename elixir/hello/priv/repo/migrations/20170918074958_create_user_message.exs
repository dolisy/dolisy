defmodule Hello.Repo.Migrations.CreateUserMessage do
  use Ecto.Migration

  def change do
    create table(:user_messages) do
      add :title, :string
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:user_messages, [:user_id])

  end
end
