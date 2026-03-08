defmodule XApiEx.Api.ListPostsTest do
  @moduledoc """
  Tests for `XApiEx.Api.ListPosts` — fetching the post timeline for a list.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "list_posts_lookup/3" do
    test "returns ListPostsLookup200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/lists/list123/tweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.list_posts_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{}} =
               XApiEx.Api.ListPosts.list_posts_lookup(conn, "list123")
    end

    test "interpolates list ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/lists/mylist/tweets"
        %Tesla.Env{status: 200, body: Fixtures.list_posts_200()}
      end)

      XApiEx.Api.ListPosts.list_posts_lookup(conn, "mylist")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.ListPosts.list_posts_lookup(conn, "list123")
    end
  end
end
