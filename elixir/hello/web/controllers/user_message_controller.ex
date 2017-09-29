defmodule Hello.UserMessageController do
  use Hello.Web, :controller

  alias Hello.UserMessage

  def index(conn, _params) do
    user_messages = Repo.all(UserMessage)
    render(conn, "index.html", user_messages: user_messages)
  end

  def new(conn, _params) do
    changeset = UserMessage.changeset(%UserMessage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_message" => user_message_params}) do
    changeset = UserMessage.changeset(%UserMessage{}, user_message_params)

    case Repo.insert(changeset) do
      {:ok, _user_message} ->
        conn
        |> put_flash(:info, "User message created successfully.")
        |> redirect(to: user_message_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_message = Repo.get!(UserMessage, id)
    render(conn, "show.html", user_message: user_message)
  end

  def edit(conn, %{"id" => id}) do
    user_message = Repo.get!(UserMessage, id)
    changeset = UserMessage.changeset(user_message)
    render(conn, "edit.html", user_message: user_message, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_message" => user_message_params}) do
    user_message = Repo.get!(UserMessage, id)
    changeset = UserMessage.changeset(user_message, user_message_params)

    case Repo.update(changeset) do
      {:ok, user_message} ->
        conn
        |> put_flash(:info, "User message updated successfully.")
        |> redirect(to: user_message_path(conn, :show, user_message))
      {:error, changeset} ->
        render(conn, "edit.html", user_message: user_message, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_message = Repo.get!(UserMessage, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user_message)

    conn
    |> put_flash(:info, "User message deleted successfully.")
    |> redirect(to: user_message_path(conn, :index))
  end
end
