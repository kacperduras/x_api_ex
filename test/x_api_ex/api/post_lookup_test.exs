defmodule XApiEx.Api.PostLookupTest do
  @moduledoc """
  Tests for `XApiEx.Api.PostLookup` — fetching single and multiple posts by ID.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "single_post/3" do
    test "returns SinglePost200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/123"} ->
          %Tesla.Env{status: 200, body: Fixtures.single_post_200("123", "Test post")}
      end)

      assert {:ok, %XApiEx.Model.PostResponse{data: data}} =
               XApiEx.Api.PostLookup.single_post(conn, "123")

      assert data.id == "123"
      assert data.text == "Test post"
    end

    test "interpolates post ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/tweets/abc999"
        %Tesla.Env{status: 200, body: Fixtures.single_post_200("abc999")}
      end)

      XApiEx.Api.PostLookup.single_post(conn, "abc999")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.PostLookup.single_post(conn, "123")
    end

    test "returns raw Tesla.Env on 429", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 429, body: "rate limited"}
      end)

      assert {:ok, %Tesla.Env{status: 429}} =
               XApiEx.Api.PostLookup.single_post(conn, "123")
    end

    test "sends GET request", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :get
        %Tesla.Env{status: 200, body: Fixtures.single_post_200()}
      end)

      XApiEx.Api.PostLookup.single_post(conn, "123")
    end

    test "passes tweet.fields as query param", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert {:"tweet.fields", "id,text,created_at"} in env.query
        %Tesla.Env{status: 200, body: Fixtures.single_post_200()}
      end)

      XApiEx.Api.PostLookup.single_post(conn, "123", "tweet.fields": "id,text,created_at")
    end
  end

  describe "multiple_posts/2" do
    test "returns MultiplePosts200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets"} ->
          %Tesla.Env{status: 200, body: Fixtures.multiple_posts_200()}
      end)

      assert {:ok, %XApiEx.Model.PostsResponse{data: data}} =
               XApiEx.Api.PostLookup.multiple_posts(conn, ids: "111,222")

      assert length(data) == 2
    end

    test "passes ids as query param", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert {:ids, "111,222,333"} in env.query
        %Tesla.Env{status: 200, body: Fixtures.multiple_posts_200()}
      end)

      XApiEx.Api.PostLookup.multiple_posts(conn, ids: "111,222,333")
    end

    test "returns MultiplePosts400Response on 400", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 400, body: Fixtures.bad_request_response()}
      end)

      assert {:ok, %XApiEx.Model.MultiplePosts400Response{}} =
               XApiEx.Api.PostLookup.multiple_posts(conn)
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.PostLookup.multiple_posts(conn)
    end
  end
end
