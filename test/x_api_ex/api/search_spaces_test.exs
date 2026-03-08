defmodule XApiEx.Api.SearchSpacesTest do
  @moduledoc """
  Tests for `XApiEx.Api.SearchSpaces` — searching Spaces by title.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "search_spaces_by_title/2" do
    test "returns SearchSpacesByTitle200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/spaces/search"} ->
          %Tesla.Env{status: 200, body: Fixtures.search_spaces_200()}
      end)

      assert {:ok, _} = XApiEx.Api.SearchSpaces.search_spaces_by_title(conn, query: "tech talks")
    end

    test "passes query param", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert {:query, "elixir"} in env.query
        %Tesla.Env{status: 200, body: Fixtures.search_spaces_200()}
      end)

      XApiEx.Api.SearchSpaces.search_spaces_by_title(conn, query: "elixir")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.SearchSpaces.search_spaces_by_title(conn)
    end
  end
end
