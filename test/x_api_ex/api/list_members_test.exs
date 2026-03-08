defmodule XApiEx.Api.ListMembersTest do
  @moduledoc """
  Tests for `XApiEx.Api.ListMembers` — adding/removing list members and looking up memberships.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "add_a_member/3" do
    test "sends POST to /2/lists/:id/members", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/lists/list123/members"
        %Tesla.Env{status: 200, body: Fixtures.add_member_200()}
      end)

      assert {:ok, %XApiEx.Model.AddAMember200Response{}} =
               XApiEx.Api.ListMembers.add_a_member(conn, "list123")
    end
  end

  describe "remove_a_member/4" do
    test "sends DELETE to /2/lists/:id/members/:user_id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/lists/list123/members/user456"
        %Tesla.Env{status: 200, body: Fixtures.remove_member_200()}
      end)

      assert {:ok, _} = XApiEx.Api.ListMembers.remove_a_member(conn, "list123", "user456")
    end
  end

  describe "members_lookup/3" do
    test "returns MembersLookup200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/lists/list123/members"} ->
          %Tesla.Env{status: 200, body: Fixtures.list_members_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{}} =
               XApiEx.Api.ListMembers.members_lookup(conn, "list123")
    end
  end

  describe "user_memberships/3" do
    test "sends GET to /2/users/:id/list_memberships", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/users/user111/list_memberships"
        %Tesla.Env{status: 200, body: Fixtures.lists_by_user_200()}
      end)

      assert {:ok, _} = XApiEx.Api.ListMembers.user_memberships(conn, "user111")
    end
  end
end
