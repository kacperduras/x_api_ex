defmodule XApiEx.Api.QuotePostsTest do
  @moduledoc """
  Tests for `XApiEx.Api.QuotePosts` — fetching quote posts for a given post ID.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "quote_posts_by_post_id/3" do
    test "returns QuotePostsByPostId200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/999/quote_tweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.quote_posts_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{}} =
               XApiEx.Api.QuotePosts.quote_posts_by_post_id(conn, "999")
    end

    test "interpolates post ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/tweets/abc123/quote_tweets"
        %Tesla.Env{status: 200, body: Fixtures.quote_posts_200()}
      end)

      XApiEx.Api.QuotePosts.quote_posts_by_post_id(conn, "abc123")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.QuotePosts.quote_posts_by_post_id(conn, "999")
    end
  end
end
