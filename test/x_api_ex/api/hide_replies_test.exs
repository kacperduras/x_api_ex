defmodule XApiEx.Api.HideRepliesTest do
  @moduledoc """
  Tests for `XApiEx.Api.HideReplies` — hiding and unhiding replies to posts.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "hide_a_reply/3" do
    test "returns HideAReply200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :put, url: "https://api.x.com/2/tweets/999/hidden"} ->
          %Tesla.Env{status: 200, body: Fixtures.hide_reply_200()}
      end)

      assert {:ok, %XApiEx.Model.HideAReply200Response{data: data}} =
               XApiEx.Api.HideReplies.hide_a_reply(conn, "999",
                 body: %XApiEx.Model.HideAReplyRequest{hidden: true}
               )

      assert data.hidden == true
    end

    test "sends PUT to /2/tweets/:id/hidden", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :put
        assert env.url == "https://api.x.com/2/tweets/abc123/hidden"
        %Tesla.Env{status: 200, body: Fixtures.hide_reply_200()}
      end)

      XApiEx.Api.HideReplies.hide_a_reply(conn, "abc123")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.HideReplies.hide_a_reply(conn, "999")
    end
  end
end
