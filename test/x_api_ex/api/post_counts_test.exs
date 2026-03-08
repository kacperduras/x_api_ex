defmodule XApiEx.Api.PostCountsTest do
  @moduledoc """
  Tests for `XApiEx.Api.PostCounts` — retrieving recent and full-archive post count metrics.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "recent_post_counts/2" do
    test "returns FullArchivePostCounts200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/counts/recent"} ->
          %Tesla.Env{status: 200, body: Fixtures.post_counts_200()}
      end)

      assert {:ok, %XApiEx.Model.PostCountsResponse{}} =
               XApiEx.Api.PostCounts.recent_post_counts(conn, query: "elixir")
    end

    test "passes query param", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert {:query, "elixir lang"} in env.query
        %Tesla.Env{status: 200, body: Fixtures.post_counts_200()}
      end)

      XApiEx.Api.PostCounts.recent_post_counts(conn, query: "elixir lang")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.PostCounts.recent_post_counts(conn)
    end
  end

  describe "full_archive_post_counts/2" do
    test "returns FullArchivePostCounts200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/counts/all"} ->
          %Tesla.Env{status: 200, body: Fixtures.post_counts_200()}
      end)

      assert {:ok, %XApiEx.Model.PostCountsResponse{}} =
               XApiEx.Api.PostCounts.full_archive_post_counts(conn, query: "elixir")
    end
  end
end
