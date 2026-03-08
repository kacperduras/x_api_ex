defmodule XApiEx.Api.ListTest do
  @moduledoc """
  Tests for `XApiEx.Api.List` — the combined list management API covering CRUD, members, follows, pins, and posts.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "create_a_list/2" do
    test "returns CreateAList201Response on 201", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/lists"} ->
          %Tesla.Env{status: 201, body: Fixtures.create_list_201()}
      end)

      assert {:ok, %XApiEx.Model.CreateAList201Response{}} =
               XApiEx.Api.List.create_a_list(conn,
                 body: %XApiEx.Model.CreateAListRequest{name: "Test List"}
               )
    end
  end

  describe "delete_a_list/3" do
    test "sends DELETE to /2/lists/:id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/lists/list123"
        %Tesla.Env{status: 200, body: Fixtures.delete_list_200()}
      end)

      assert {:ok, %XApiEx.Model.DeleteAPost200Response{}} =
               XApiEx.Api.List.delete_a_list(conn, "list123")
    end
  end

  describe "update_a_list/3" do
    test "sends PUT to /2/lists/:id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :put
        assert env.url == "https://api.x.com/2/lists/list123"
        %Tesla.Env{status: 200, body: Fixtures.update_list_200()}
      end)

      assert {:ok, _} = XApiEx.Api.List.update_a_list(conn, "list123")
    end
  end

  describe "list_by_id/3" do
    test "returns ListById200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/lists/list123"} ->
          %Tesla.Env{status: 200, body: Fixtures.list_lookup_200()}
      end)

      assert {:ok, %XApiEx.Model.ListResponse{}} =
               XApiEx.Api.List.list_by_id(conn, "list123")
    end
  end

  describe "members_lookup/3" do
    test "returns MembersLookup200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/lists/list123/members"} ->
          %Tesla.Env{status: 200, body: Fixtures.list_members_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{}} =
               XApiEx.Api.List.members_lookup(conn, "list123")
    end
  end

  describe "add_a_member/3" do
    test "sends POST to /2/lists/:id/members", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/lists/list123/members"
        %Tesla.Env{status: 200, body: Fixtures.add_member_200()}
      end)

      assert {:ok, %XApiEx.Model.AddAMember200Response{}} =
               XApiEx.Api.List.add_a_member(conn, "list123")
    end
  end

  describe "remove_a_member/4" do
    test "sends DELETE to /2/lists/:id/members/:user_id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/lists/list123/members/user456"
        %Tesla.Env{status: 200, body: Fixtures.remove_member_200()}
      end)

      assert {:ok, _} = XApiEx.Api.List.remove_a_member(conn, "list123", "user456")
    end
  end

  describe "follower_lookup/3" do
    test "returns FollowerLookup200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/lists/list123/followers"} ->
          %Tesla.Env{status: 200, body: Fixtures.list_followers_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{}} =
               XApiEx.Api.List.follower_lookup(conn, "list123")
    end
  end

  describe "follow_a_list/3" do
    test "sends POST to /2/users/:id/followed_lists", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/users/user111/followed_lists"
        %Tesla.Env{status: 200, body: Fixtures.follow_list_200()}
      end)

      assert {:ok, %XApiEx.Model.FollowAList200Response{}} =
               XApiEx.Api.List.follow_a_list(conn, "user111")
    end
  end

  describe "unfollow_a_list/4" do
    test "sends DELETE to /2/users/:id/followed_lists/:list_id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/users/user111/followed_lists/list123"
        %Tesla.Env{status: 200, body: Fixtures.unfollow_list_200()}
      end)

      assert {:ok, _} = XApiEx.Api.List.unfollow_a_list(conn, "user111", "list123")
    end
  end

  describe "list_posts_lookup/3" do
    test "returns ListPostsLookup200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/lists/list123/tweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.list_posts_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{}} =
               XApiEx.Api.List.list_posts_lookup(conn, "list123")
    end
  end

  describe "pin_a_list/3" do
    test "sends POST to /2/users/:id/pinned_lists", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/users/user111/pinned_lists"
        %Tesla.Env{status: 200, body: Fixtures.pin_list_200()}
      end)

      assert {:ok, _} = XApiEx.Api.List.pin_a_list(conn, "user111")
    end
  end

  describe "unpin_a_list/4" do
    test "sends DELETE to /2/users/:id/pinned_lists/:list_id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/users/user111/pinned_lists/list123"
        %Tesla.Env{status: 200, body: Fixtures.unpin_list_200()}
      end)

      assert {:ok, _} = XApiEx.Api.List.unpin_a_list(conn, "user111", "list123")
    end
  end

  describe "user_owned_lists/3" do
    test "returns UserOwnedLists200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/user111/owned_lists"} ->
          %Tesla.Env{status: 200, body: Fixtures.lists_by_user_200()}
      end)

      assert {:ok, _} = XApiEx.Api.List.user_owned_lists(conn, "user111")
    end
  end
end
