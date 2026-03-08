defmodule XApiEx.Api.ListLookupTest do
  @moduledoc """
  Tests for `XApiEx.Api.ListLookup` — fetching lists by ID and listing user-owned lists.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "list_by_id/3" do
    test "returns ListById200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/lists/list123"} ->
          %Tesla.Env{status: 200, body: Fixtures.list_lookup_200()}
      end)

      assert {:ok, %XApiEx.Model.ListResponse{}} =
               XApiEx.Api.ListLookup.list_by_id(conn, "list123")
    end

    test "interpolates list ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/lists/mylist"
        %Tesla.Env{status: 200, body: Fixtures.list_lookup_200()}
      end)

      XApiEx.Api.ListLookup.list_by_id(conn, "mylist")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.ListLookup.list_by_id(conn, "list123")
    end
  end

  describe "user_owned_lists/3" do
    test "sends GET to /2/users/:id/owned_lists", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :get
        assert env.url == "https://api.x.com/2/users/user111/owned_lists"
        %Tesla.Env{status: 200, body: Fixtures.lists_by_user_200()}
      end)

      assert {:ok, _} = XApiEx.Api.ListLookup.user_owned_lists(conn, "user111")
    end
  end
end
