defmodule XApiEx.Api.LikesTest do
  @moduledoc """
  Tests for `XApiEx.Api.Likes` — like/unlike posts and look up liking users.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "like_a_post/3" do
    test "returns LikeAPost200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/users/111/likes"} ->
          %Tesla.Env{status: 200, body: Fixtures.like_post_200()}
      end)

      assert {:ok, %XApiEx.Model.LikeAPost200Response{data: data}} =
               XApiEx.Api.Likes.like_a_post(conn, "111")

      assert data.liked == true
    end

    test "interpolates user ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/abc/likes"
        %Tesla.Env{status: 200, body: Fixtures.like_post_200()}
      end)

      XApiEx.Api.Likes.like_a_post(conn, "abc")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Likes.like_a_post(conn, "111")
    end
  end

  describe "unlike_a_post/4" do
    test "returns UnlikeAPost200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :delete, url: "https://api.x.com/2/users/111/likes/999"} ->
          %Tesla.Env{status: 200, body: Fixtures.unlike_post_200()}
      end)

      assert {:ok, %XApiEx.Model.UnlikeAPost200Response{data: data}} =
               XApiEx.Api.Likes.unlike_a_post(conn, "111", "999")

      assert data.liked == false
    end

    test "interpolates both IDs in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/user1/likes/post1"
        %Tesla.Env{status: 200, body: Fixtures.unlike_post_200()}
      end)

      XApiEx.Api.Likes.unlike_a_post(conn, "user1", "post1")
    end
  end

  describe "liked_posts/3" do
    test "returns LikedPosts200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/111/liked_tweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.liked_posts_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{}} =
               XApiEx.Api.Likes.liked_posts(conn, "111")
    end
  end

  describe "liking_users/3" do
    test "returns LikingUsers200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/999/liking_users"} ->
          %Tesla.Env{status: 200, body: Fixtures.liking_users_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{}} =
               XApiEx.Api.Likes.liking_users(conn, "999")
    end
  end
end
