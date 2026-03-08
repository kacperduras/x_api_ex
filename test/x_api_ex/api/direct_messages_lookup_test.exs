defmodule XApiEx.Api.DirectMessagesLookupTest do
  @moduledoc """
  Tests for `XApiEx.Api.DirectMessagesLookup` — fetching DM events from conversations and inboxes.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "get_dms_by_conversation/3" do
    test "returns GetDmsByConversation200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/dm_conversations/conv123/dm_events"} ->
          %Tesla.Env{status: 200, body: Fixtures.dm_conversation_200()}
      end)

      assert {:ok, %XApiEx.Model.DmsResponse{}} =
               XApiEx.Api.DirectMessagesLookup.get_dms_by_conversation(conn, "conv123")
    end

    test "interpolates conversation ID in URL", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/dm_conversations/myconv/dm_events"
        %Tesla.Env{status: 200, body: Fixtures.dm_conversation_200()}
      end)

      XApiEx.Api.DirectMessagesLookup.get_dms_by_conversation(conn, "myconv")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.DirectMessagesLookup.get_dms_by_conversation(conn, "conv123")
    end
  end

  describe "dm_events_by_user/2" do
    test "returns DmEventsByUser200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/dm_events"} ->
          %Tesla.Env{status: 200, body: Fixtures.dm_conversation_200()}
      end)

      assert {:ok, _} = XApiEx.Api.DirectMessagesLookup.dm_events_by_user(conn)
    end
  end

  describe "dm_events_by11_conversation/3" do
    test "sends GET to /2/dm_conversations/with/:participant_id/dm_events", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/dm_conversations/with/user999/dm_events"
        %Tesla.Env{status: 200, body: Fixtures.dm_conversation_200()}
      end)

      XApiEx.Api.DirectMessagesLookup.dm_events_by11_conversation(conn, "user999")
    end
  end
end
