defmodule XApiEx.Api.ListFollowsTest do
  @moduledoc """
  Tests for `XApiEx.Api.ListFollows` — following/unfollowing lists and looking up list followers.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "follow_a_list/3" do
    test "sends POST to /2/users/:id/followed_lists", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/users/user111/followed_lists"
        %Tesla.Env{status: 200, body: Fixtures.follow_list_200()}
      end)

      assert {:ok, %XApiEx.Model.FollowAList200Response{}} =
               XApiEx.Api.ListFollows.follow_a_list(conn, "user111")
    end
  end

  describe "unfollow_a_list/4" do
    test "sends DELETE to /2/users/:id/followed_lists/:list_id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/users/user111/followed_lists/list123"
        %Tesla.Env{status: 200, body: Fixtures.unfollow_list_200()}
      end)

      assert {:ok, _} = XApiEx.Api.ListFollows.unfollow_a_list(conn, "user111", "list123")
    end
  end

  describe "follower_lookup/3" do
    test "returns FollowerLookup200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/lists/list123/followers"} ->
          %Tesla.Env{status: 200, body: Fixtures.list_followers_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{}} =
               XApiEx.Api.ListFollows.follower_lookup(conn, "list123")
    end
  end

  describe "user_s_followed_lists/3" do
    test "returns UserSFollowedLists200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/user111/followed_lists"} ->
          %Tesla.Env{status: 200, body: Fixtures.lists_by_user_200()}
      end)

      assert {:ok, _} = XApiEx.Api.ListFollows.user_s_followed_lists(conn, "user111")
    end
  end
end
