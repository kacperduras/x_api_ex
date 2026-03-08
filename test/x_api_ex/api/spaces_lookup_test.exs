defmodule XApiEx.Api.SpacesLookupTest do
  @moduledoc """
  Tests for `XApiEx.Api.SpacesLookup` — fetching Spaces by ID, by creator, and looking up ticket buyers.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "spaces_lookup_by_single_id/3" do
    test "sends GET to /2/spaces/:id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces/space123"
        %Tesla.Env{status: 200, body: Fixtures.space_lookup_200()}
      end)

      assert {:ok, _} = XApiEx.Api.SpacesLookup.spaces_lookup_by_single_id(conn, "space123")
    end
  end

  describe "spaces_lookup_by_list_of_ids/2" do
    test "sends GET to /2/spaces", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces"
        %Tesla.Env{status: 200, body: Fixtures.spaces_lookup_200()}
      end)

      assert {:ok, _} = XApiEx.Api.SpacesLookup.spaces_lookup_by_list_of_ids(conn)
    end
  end

  describe "lookup_spaces_created_by_one_or_more_users/2" do
    test "sends GET to /2/spaces/by/creator_ids", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces/by/creator_ids"
        %Tesla.Env{status: 200, body: Fixtures.spaces_lookup_200()}
      end)

      assert {:ok, _} =
               XApiEx.Api.SpacesLookup.lookup_spaces_created_by_one_or_more_users(conn)
    end
  end

  describe "users_who_bought_a_ticket_to_a_space/3" do
    test "sends GET to /2/spaces/:id/buyers", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/spaces/space123/buyers"
        %Tesla.Env{status: 200, body: Fixtures.users_by_id_200()}
      end)

      assert {:ok, _} =
               XApiEx.Api.SpacesLookup.users_who_bought_a_ticket_to_a_space(conn, "space123")
    end
  end
end
