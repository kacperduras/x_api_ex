defmodule XApiEx.Api.TimelinesTest do
  @moduledoc """
  Tests for `XApiEx.Api.Timelines` — fetching user post timelines, mentions, and home timelines.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "user_post_timeline_by_id/3" do
    test "returns UserPostTimeline200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/111/tweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.user_timeline_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{}} =
               XApiEx.Api.Timelines.user_post_timeline_by_id(conn, "111")
    end

    test "interpolates user ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/abc/tweets"
        %Tesla.Env{status: 200, body: Fixtures.user_timeline_200()}
      end)

      XApiEx.Api.Timelines.user_post_timeline_by_id(conn, "abc")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Timelines.user_post_timeline_by_id(conn, "111")
    end
  end

  describe "user_mention_timeline_by_id/3" do
    test "returns UserMentionTimeline200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/111/mentions"} ->
          %Tesla.Env{status: 200, body: Fixtures.user_timeline_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{}} =
               XApiEx.Api.Timelines.user_mention_timeline_by_id(conn, "111")
    end
  end

  describe "reverse_chronological_home_timeline_by_id/3" do
    test "sends GET to /2/users/:id/timelines/reverse_chronological", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/111/timelines/reverse_chronological"
        %Tesla.Env{status: 200, body: Fixtures.user_timeline_200()}
      end)

      assert {:ok, _} =
               XApiEx.Api.Timelines.reverse_chronological_home_timeline_by_id(conn, "111")
    end
  end
end
