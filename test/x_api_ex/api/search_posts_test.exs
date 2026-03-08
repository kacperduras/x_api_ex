defmodule XApiEx.Api.SearchPostsTest do
  @moduledoc """
  Tests for `XApiEx.Api.SearchPosts` — recent and full-archive post search.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "recent_search/2" do
    test "returns FullArchiveSearch200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/search/recent"} ->
          %Tesla.Env{status: 200, body: Fixtures.search_posts_200()}
      end)

      assert {:ok, %XApiEx.Model.SearchResponse{}} =
               XApiEx.Api.SearchPosts.recent_search(conn, query: "elixir lang")
    end

    test "passes query param", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert {:query, "hello world"} in env.query
        %Tesla.Env{status: 200, body: Fixtures.search_posts_200()}
      end)

      XApiEx.Api.SearchPosts.recent_search(conn, query: "hello world")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.SearchPosts.recent_search(conn)
    end
  end

  describe "full_archive_search/2" do
    test "returns FullArchiveSearch200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/search/all"} ->
          %Tesla.Env{status: 200, body: Fixtures.search_posts_200()}
      end)

      assert {:ok, %XApiEx.Model.SearchResponse{}} =
               XApiEx.Api.SearchPosts.full_archive_search(conn, query: "elixir")
    end
  end
end
