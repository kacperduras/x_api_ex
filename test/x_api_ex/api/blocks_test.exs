defmodule XApiEx.Api.BlocksTest do
  @moduledoc """
  Tests for `XApiEx.Api.Blocks` — looking up a user's blocked accounts.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "blocks_lookup/3" do
    test "returns BlocksLookup200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/111/blocking"} ->
          %Tesla.Env{status: 200, body: Fixtures.blocks_lookup_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{data: data}} =
               XApiEx.Api.Blocks.blocks_lookup(conn, "111")

      assert length(data) == 1
    end

    test "interpolates user ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/abc/blocking"
        %Tesla.Env{status: 200, body: Fixtures.blocks_lookup_200()}
      end)

      XApiEx.Api.Blocks.blocks_lookup(conn, "abc")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Blocks.blocks_lookup(conn, "111")
    end

    test "returns ApiError on 429", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 429, body: ~s({"errors":[{"message":"Rate limited"}]})}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Blocks.blocks_lookup(conn, "111")
    end
  end
end
