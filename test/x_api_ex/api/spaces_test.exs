defmodule XApiEx.Api.SpacesTest do
  @moduledoc """
  Tests for `XApiEx.Api.Spaces` — the combined Spaces API covering lookup, search, and creator queries.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "spaces_lookup_by_single_id/3" do
    test "returns SpacesLookupBySingleId200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/spaces/1YpKkgVzNbNKj"} ->
          %Tesla.Env{status: 200, body: Fixtures.space_lookup_200()}
      end)

      assert {:ok, _} = XApiEx.Api.Spaces.spaces_lookup_by_single_id(conn, "1YpKkgVzNbNKj")
    end

    test "interpolates space ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces/space123"
        %Tesla.Env{status: 200, body: Fixtures.space_lookup_200()}
      end)

      XApiEx.Api.Spaces.spaces_lookup_by_single_id(conn, "space123")
    end
  end

  describe "spaces_lookup_by_list_of_ids/2" do
    test "sends GET to /2/spaces", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces"
        %Tesla.Env{status: 200, body: Fixtures.spaces_lookup_200()}
      end)

      assert {:ok, _} = XApiEx.Api.Spaces.spaces_lookup_by_list_of_ids(conn)
    end
  end

  describe "search_spaces_by_title/2" do
    test "sends GET to /2/spaces/search", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces/search"
        %Tesla.Env{status: 200, body: Fixtures.search_spaces_200()}
      end)

      assert {:ok, _} = XApiEx.Api.Spaces.search_spaces_by_title(conn, query: "tech")
    end
  end

  describe "lookup_spaces_created_by_one_or_more_users/2" do
    test "sends GET to /2/spaces/by/creator_ids", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces/by/creator_ids"
        %Tesla.Env{status: 200, body: Fixtures.spaces_lookup_200()}
      end)

      assert {:ok, _} = XApiEx.Api.Spaces.lookup_spaces_created_by_one_or_more_users(conn)
    end
  end

  describe "users_who_bought_a_ticket_to_a_space/3" do
    test "sends GET to /2/spaces/:id/buyers", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces/space123/buyers"
        %Tesla.Env{status: 200, body: Fixtures.users_by_id_200()}
      end)

      assert {:ok, _} = XApiEx.Api.Spaces.users_who_bought_a_ticket_to_a_space(conn, "space123")
    end
  end
end
