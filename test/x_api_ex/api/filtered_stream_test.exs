defmodule XApiEx.Api.FilteredStreamTest do
  @moduledoc """
  Tests for `XApiEx.Api.FilteredStream` — managing stream filter rules and consuming the filtered stream.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "retrieve_rules/2" do
    test "returns AddRules200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/tweets/search/stream/rules"} ->
          %Tesla.Env{status: 200, body: Fixtures.stream_rules_200()}
      end)

      assert {:ok, %XApiEx.Model.FilterRulesResponse{}} =
               XApiEx.Api.FilteredStream.retrieve_rules(conn)
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.FilteredStream.retrieve_rules(conn)
    end
  end

  describe "add_rules/2" do
    test "sends POST to /2/tweets/search/stream/rules", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/tweets/search/stream/rules"
        %Tesla.Env{status: 201, body: Fixtures.add_rules_201()}
      end)

      assert {:ok, _} = XApiEx.Api.FilteredStream.add_rules(conn)
    end
  end

  describe "stream_see_description/2" do
    test "sends GET to /2/tweets/search/stream", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :get
        assert env.url == "https://api.x.com/2/tweets/search/stream"

        %Tesla.Env{
          status: 200,
          body: ~s({"data":{"id":"111","text":"stream post","edit_history_tweet_ids":["111"]}})
        }
      end)

      assert {:ok, _} = XApiEx.Api.FilteredStream.stream_see_description(conn)
    end
  end
end
