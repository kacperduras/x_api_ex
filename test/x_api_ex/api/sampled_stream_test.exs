defmodule XApiEx.Api.SampledStreamTest do
  @moduledoc """
  Tests for `XApiEx.Api.SampledStream` — consuming the sampled real-time post stream.
  """
  use XApiEx.ApiCase

  describe "stream_see_description1/2" do
    test "sends GET to /2/tweets/sample/stream", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :get
        assert env.url == "https://api.x.com/2/tweets/sample/stream"

        %Tesla.Env{
          status: 200,
          body: ~s({"data":{"id":"111","text":"sample post","edit_history_tweet_ids":["111"]}})
        }
      end)

      assert {:ok, _} = XApiEx.Api.SampledStream.stream_see_description1(conn)
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: ~s({"errors":[{"message":"Unauthorized"}]})}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.SampledStream.stream_see_description1(conn)
    end
  end
end
