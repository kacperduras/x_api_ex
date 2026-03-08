defmodule XApiEx.Api.FollowsTest do
  @moduledoc """
  Tests for `XApiEx.Api.Follows` — following/unfollowing users and looking up followers and following lists.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "follow_a_user_id/3" do
    test "returns FollowAUserId200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/users/111/following"} ->
          %Tesla.Env{status: 200, body: Fixtures.follow_user_200()}
      end)

      assert {:ok, %XApiEx.Model.FollowAUserId200Response{data: data}} =
               XApiEx.Api.Follows.follow_a_user_id(conn, "111",
                 body: %XApiEx.Model.FollowAUserIdRequest{target_user_id: "222"}
               )

      assert data.following == true
    end

    test "interpolates source user ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/source123/following"
        %Tesla.Env{status: 200, body: Fixtures.follow_user_200()}
      end)

      XApiEx.Api.Follows.follow_a_user_id(conn, "source123")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Follows.follow_a_user_id(conn, "111")
    end

    test "returns ApiError on 429", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 429, body: Fixtures.rate_limit_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Follows.follow_a_user_id(conn, "111")
    end
  end

  describe "unfollow_a_user_id/4" do
    test "returns UnfollowAUserId200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :delete, url: "https://api.x.com/2/users/111/following/222"} ->
          %Tesla.Env{status: 200, body: Fixtures.unfollow_user_200()}
      end)

      assert {:ok, %XApiEx.Model.UnfollowAUserId200Response{data: data}} =
               XApiEx.Api.Follows.unfollow_a_user_id(conn, "111", "222")

      assert data.following == false
    end

    test "interpolates both user IDs in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/source/following/target"
        %Tesla.Env{status: 200, body: Fixtures.unfollow_user_200()}
      end)

      XApiEx.Api.Follows.unfollow_a_user_id(conn, "source", "target")
    end
  end

  describe "followers_of_user_id/3" do
    test "returns FollowersOfUserId200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/111/followers"} ->
          %Tesla.Env{status: 200, body: Fixtures.follower_lookup_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{data: data}} =
               XApiEx.Api.Follows.followers_of_user_id(conn, "111")

      assert length(data) == 1
    end

    test "returns ApiError on 429", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 429, body: Fixtures.rate_limit_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Follows.followers_of_user_id(conn, "111")
    end

    test "passes pagination params", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert {:max_results, "50"} in env.query
        assert {:pagination_token, "next_page"} in env.query
        %Tesla.Env{status: 200, body: Fixtures.follower_lookup_200()}
      end)

      XApiEx.Api.Follows.followers_of_user_id(conn, "111",
        max_results: "50",
        pagination_token: "next_page"
      )
    end
  end

  describe "users_a_user_id_is_following/3" do
    test "returns UsersAUserIdIsFollowing200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/111/following"} ->
          %Tesla.Env{status: 200, body: Fixtures.following_lookup_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{}} =
               XApiEx.Api.Follows.users_a_user_id_is_following(conn, "111")
    end
  end
end
