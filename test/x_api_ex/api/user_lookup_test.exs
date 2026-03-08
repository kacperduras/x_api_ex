defmodule XApiEx.Api.UserLookupTest do
  @moduledoc """
  Tests for `XApiEx.Api.UserLookup` — fetching users by ID, username, and the authenticated user.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "user_by_id/3" do
    test "returns UserById200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/987654321"} ->
          %Tesla.Env{
            status: 200,
            body: Fixtures.user_by_id_200("987654321", "Test User", "testuser")
          }
      end)

      assert {:ok, %XApiEx.Model.UserResponse{data: data}} =
               XApiEx.Api.UserLookup.user_by_id(conn, "987654321")

      assert data.id == "987654321"
      assert data.name == "Test User"
      assert data.username == "testuser"
    end

    test "interpolates user ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/abc123"
        %Tesla.Env{status: 200, body: Fixtures.user_by_id_200("abc123")}
      end)

      XApiEx.Api.UserLookup.user_by_id(conn, "abc123")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.UserLookup.user_by_id(conn, "123")
    end

    test "returns raw Tesla.Env on 429", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 429, body: "rate limited"}
      end)

      assert {:ok, %Tesla.Env{status: 429}} =
               XApiEx.Api.UserLookup.user_by_id(conn, "123")
    end

    test "passes user.fields query param", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert {:"user.fields", "id,name,username,description"} in env.query
        %Tesla.Env{status: 200, body: Fixtures.user_by_id_200()}
      end)

      XApiEx.Api.UserLookup.user_by_id(conn, "123", "user.fields": "id,name,username,description")
    end
  end

  describe "user_by_username/3" do
    test "returns UserByUsername200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/by/username/testuser"} ->
          %Tesla.Env{status: 200, body: Fixtures.user_by_username_200()}
      end)

      assert {:ok, %XApiEx.Model.UserResponse{data: data}} =
               XApiEx.Api.UserLookup.user_by_username(conn, "testuser")

      assert data.username == "testuser"
    end

    test "interpolates username in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/by/username/elixirlang"
        %Tesla.Env{status: 200, body: Fixtures.user_by_username_200()}
      end)

      XApiEx.Api.UserLookup.user_by_username(conn, "elixirlang")
    end
  end

  describe "users_by_id/2" do
    test "returns UsersById200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users"} ->
          %Tesla.Env{status: 200, body: Fixtures.users_by_id_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{data: data}} =
               XApiEx.Api.UserLookup.users_by_id(conn, ids: "111,222")

      assert length(data) == 2
    end

    test "returns UsersById400Response on 400", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 400, body: Fixtures.bad_request_response()}
      end)

      assert {:ok, %XApiEx.Model.UsersById400Response{}} =
               XApiEx.Api.UserLookup.users_by_id(conn)
    end
  end

  describe "users_by_username/2" do
    test "returns UsersByUsername200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 200, body: Fixtures.users_by_username_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{}} =
               XApiEx.Api.UserLookup.users_by_username(conn, usernames: "testuser")
    end

    test "passes usernames query param", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert {:usernames, "userone,usertwo"} in env.query
        %Tesla.Env{status: 200, body: Fixtures.users_by_username_200()}
      end)

      XApiEx.Api.UserLookup.users_by_username(conn, usernames: "userone,usertwo")
    end
  end

  describe "authenticated_user_lookup/2" do
    test "sends GET to /2/users/me", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :get
        assert env.url == "https://api.x.com/2/users/me"
        %Tesla.Env{status: 200, body: Fixtures.users_by_username_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{}} =
               XApiEx.Api.UserLookup.authenticated_user_lookup(conn)
    end
  end
end
