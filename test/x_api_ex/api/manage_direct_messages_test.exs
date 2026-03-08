defmodule XApiEx.Api.ManageDirectMessagesTest do
  @moduledoc """
  Tests for `XApiEx.Api.ManageDirectMessages` — sending DMs to existing conversations and creating new ones.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "add_dm_to_conversation/3" do
    test "sends POST to /2/dm_conversations/:id/messages", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/dm_conversations/conv123/messages"
        %Tesla.Env{status: 201, body: Fixtures.create_dm_200()}
      end)

      assert {:ok, %XApiEx.Model.DmResponse{}} =
               XApiEx.Api.ManageDirectMessages.add_dm_to_conversation(conn, "conv123")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.ManageDirectMessages.add_dm_to_conversation(conn, "conv123")
    end
  end

  describe "new11_dm_message/3" do
    test "sends POST to /2/dm_conversations/with/:participant_id/messages", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/dm_conversations/with/user999/messages"
        %Tesla.Env{status: 201, body: Fixtures.create_dm_200()}
      end)

      assert {:ok, %XApiEx.Model.DmResponse{}} =
               XApiEx.Api.ManageDirectMessages.new11_dm_message(conn, "user999")
    end
  end

  describe "new_group_dm_and_conversation/2" do
    test "sends POST to /2/dm_conversations/", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/dm_conversations/"
        %Tesla.Env{status: 201, body: Fixtures.create_dm_200()}
      end)

      assert {:ok, %XApiEx.Model.DmResponse{}} =
               XApiEx.Api.ManageDirectMessages.new_group_dm_and_conversation(conn)
    end
  end
end
