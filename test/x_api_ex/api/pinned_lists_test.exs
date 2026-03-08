defmodule XApiEx.Api.PinnedListsTest do
  @moduledoc """
  Tests for `XApiEx.Api.PinnedLists` — pinning/unpinning lists and fetching a user's pinned lists.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "pin_a_list/3" do
    test "returns PinAList200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/users/user111/pinned_lists"} ->
          %Tesla.Env{status: 200, body: Fixtures.pin_list_200()}
      end)

      assert {:ok, %XApiEx.Model.PinAList200Response{}} =
               XApiEx.Api.PinnedLists.pin_a_list(conn, "user111")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.PinnedLists.pin_a_list(conn, "user111")
    end
  end

  describe "unpin_a_list/4" do
    test "sends DELETE to /2/users/:id/pinned_lists/:list_id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/users/user111/pinned_lists/list123"
        %Tesla.Env{status: 200, body: Fixtures.unpin_list_200()}
      end)

      assert {:ok, _} = XApiEx.Api.PinnedLists.unpin_a_list(conn, "user111", "list123")
    end
  end

  describe "user_s_pinned_lists/3" do
    test "returns UserSPinnedLists200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/user111/pinned_lists"} ->
          %Tesla.Env{status: 200, body: Fixtures.pinned_lists_200()}
      end)

      assert {:ok, _} = XApiEx.Api.PinnedLists.user_s_pinned_lists(conn, "user111")
    end
  end
end
