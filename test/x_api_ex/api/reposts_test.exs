defmodule XApiEx.Api.RepostsTest do
  @moduledoc """
  Tests for `XApiEx.Api.Reposts` — reposting/undoing reposts and looking up users who reposted.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "repost_a_post/3" do
    test "returns RepostAPost200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/users/111/retweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.repost_200()}
      end)

      assert {:ok, %XApiEx.Model.RepostAPost200Response{data: data}} =
               XApiEx.Api.Reposts.repost_a_post(conn, "111")

      assert data.retweeted == true
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Reposts.repost_a_post(conn, "111")
    end
  end

  describe "undo_a_repost/4" do
    test "sends DELETE to /2/users/:id/retweets/:tweet_id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/users/111/retweets/999"
        %Tesla.Env{status: 200, body: Fixtures.undo_repost_200()}
      end)

      assert {:ok, %XApiEx.Model.UndoARepost200Response{}} =
               XApiEx.Api.Reposts.undo_a_repost(conn, "111", "999")
    end
  end

  describe "reposted_by/3" do
    test "returns RepostedBy200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/999/retweeted_by"} ->
          %Tesla.Env{status: 200, body: Fixtures.reposters_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{}} =
               XApiEx.Api.Reposts.reposted_by(conn, "999")
    end
  end
end
