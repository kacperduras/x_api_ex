defmodule XApiEx.Api.ManagePostsTest do
  @moduledoc """
  Tests for `XApiEx.Api.ManagePosts` — creating and deleting posts.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "create_a_post/2" do
    test "returns CreateAPost200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/tweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.create_post_200("123456789", "Hello world")}
      end)

      assert {:ok, %XApiEx.Model.CreateAPost200Response{data: data}} =
               XApiEx.Api.ManagePosts.create_a_post(conn,
                 body: %XApiEx.Model.CreateAPostRequest{text: "Hello world"}
               )

      assert data.id == "123456789"
      assert data.text == "Hello world"
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.ManagePosts.create_a_post(conn)
    end

    test "returns ApiError on 429", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 429, body: Fixtures.rate_limit_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.ManagePosts.create_a_post(conn)
    end

    test "sends POST to /2/tweets", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/tweets"
        %Tesla.Env{status: 200, body: Fixtures.create_post_200()}
      end)

      XApiEx.Api.ManagePosts.create_a_post(conn)
    end
  end

  describe "delete_a_post/3" do
    test "returns DeleteAPost200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :delete, url: "https://api.x.com/2/tweets/999"} ->
          %Tesla.Env{status: 200, body: Fixtures.delete_post_200("999")}
      end)

      assert {:ok, %XApiEx.Model.DeleteAPost200Response{data: data}} =
               XApiEx.Api.ManagePosts.delete_a_post(conn, "999")

      assert data.deleted == true
    end

    test "interpolates post ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/tweets/abc123"
        %Tesla.Env{status: 200, body: Fixtures.delete_post_200("abc123")}
      end)

      XApiEx.Api.ManagePosts.delete_a_post(conn, "abc123")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.ManagePosts.delete_a_post(conn, "123")
    end

    test "returns ApiError on 429", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 429, body: Fixtures.rate_limit_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.ManagePosts.delete_a_post(conn, "123")
    end
  end
end
