defmodule XApiEx.Api.UsagePostsTest do
  @moduledoc """
  Tests for `XApiEx.Api.UsagePosts` — retrieving post usage and capacity metrics.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "get_posts_usage/2" do
    test "returns GetPostsUsage200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/usage/tweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.posts_usage_200()}
      end)

      assert {:ok, %XApiEx.Model.GetPostsUsage200Response{}} =
               XApiEx.Api.UsagePosts.get_posts_usage(conn)
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.UsagePosts.get_posts_usage(conn)
    end

    test "sends GET request to correct path", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :get
        assert env.url == "https://api.x.com/2/usage/tweets"
        %Tesla.Env{status: 200, body: Fixtures.posts_usage_200()}
      end)

      XApiEx.Api.UsagePosts.get_posts_usage(conn)
    end
  end
end
