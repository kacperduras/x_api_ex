defmodule XApiEx.Api.BookmarksTest do
  @moduledoc """
  Tests for `XApiEx.Api.Bookmarks` — bookmarking, removing, and listing bookmarked posts.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "bookmark_a_post/3" do
    test "returns BookmarkAPost200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/users/111/bookmarks"} ->
          %Tesla.Env{status: 200, body: Fixtures.bookmark_post_200()}
      end)

      assert {:ok, %XApiEx.Model.BookmarkAPost200Response{data: data}} =
               XApiEx.Api.Bookmarks.bookmark_a_post(conn, "111",
                 body: %XApiEx.Model.BookmarkAPostRequest{tweet_id: "999"}
               )

      assert data.bookmarked == true
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Bookmarks.bookmark_a_post(conn, "111")
    end
  end

  describe "bookmarked_posts/3" do
    test "returns BookmarkedPosts200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/111/bookmarks"} ->
          %Tesla.Env{status: 200, body: Fixtures.bookmarked_posts_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{}} =
               XApiEx.Api.Bookmarks.bookmarked_posts(conn, "111")
    end
  end

  describe "remove_a_bookmark/4" do
    test "sends DELETE to /2/users/:id/bookmarks/:tweet_id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/users/111/bookmarks/999"
        %Tesla.Env{status: 200, body: Fixtures.remove_bookmark_200()}
      end)

      assert {:ok, %XApiEx.Model.BookmarkAPost200Response{}} =
               XApiEx.Api.Bookmarks.remove_a_bookmark(conn, "111", "999")
    end
  end
end
