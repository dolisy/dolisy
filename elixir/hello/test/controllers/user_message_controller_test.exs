defmodule Hello.UserMessageControllerTest do
  use Hello.ConnCase

  alias Hello.UserMessage
  @valid_attrs %{body: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user_message_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing user messages"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user_message_path(conn, :new)
    assert html_response(conn, 200) =~ "New user message"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, user_message_path(conn, :create), user_message: @valid_attrs
    assert redirected_to(conn) == user_message_path(conn, :index)
    assert Repo.get_by(UserMessage, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_message_path(conn, :create), user_message: @invalid_attrs
    assert html_response(conn, 200) =~ "New user message"
  end

  test "shows chosen resource", %{conn: conn} do
    user_message = Repo.insert! %UserMessage{}
    conn = get conn, user_message_path(conn, :show, user_message)
    assert html_response(conn, 200) =~ "Show user message"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, user_message_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    user_message = Repo.insert! %UserMessage{}
    conn = get conn, user_message_path(conn, :edit, user_message)
    assert html_response(conn, 200) =~ "Edit user message"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    user_message = Repo.insert! %UserMessage{}
    conn = put conn, user_message_path(conn, :update, user_message), user_message: @valid_attrs
    assert redirected_to(conn) == user_message_path(conn, :show, user_message)
    assert Repo.get_by(UserMessage, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    user_message = Repo.insert! %UserMessage{}
    conn = put conn, user_message_path(conn, :update, user_message), user_message: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit user message"
  end

  test "deletes chosen resource", %{conn: conn} do
    user_message = Repo.insert! %UserMessage{}
    conn = delete conn, user_message_path(conn, :delete, user_message)
    assert redirected_to(conn) == user_message_path(conn, :index)
    refute Repo.get(UserMessage, user_message.id)
  end
end
