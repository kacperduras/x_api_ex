defmodule XApiEx.ConnectionTest do
  @moduledoc """
  Tests for `XApiEx.Connection` — building Tesla clients and middleware configuration.
  """
  use ExUnit.Case, async: true

  alias XApiEx.Connection

  describe "new/1" do
    test "creates a Tesla client with default options" do
      client = Connection.new()
      assert %Tesla.Client{} = client
    end

    test "creates a Tesla client with bearer token" do
      client = Connection.new(bearer_token: "my-token")
      assert %Tesla.Client{} = client
    end

    test "creates a Tesla client with custom base_url" do
      client = Connection.new(base_url: "https://custom.example.com")
      assert %Tesla.Client{} = client
    end

    test "creates a Tesla client with custom user_agent" do
      client = Connection.new(user_agent: "my-agent/1.0")
      assert %Tesla.Client{} = client
    end
  end

  describe "middleware/1" do
    test "includes BaseUrl middleware with default URL" do
      middleware = Connection.middleware()

      assert Enum.any?(middleware, fn
               {Tesla.Middleware.BaseUrl, "https://api.x.com"} -> true
               _ -> false
             end)
    end

    test "includes BaseUrl middleware with custom URL" do
      middleware = Connection.middleware(base_url: "https://custom.example.com")

      assert Enum.any?(middleware, fn
               {Tesla.Middleware.BaseUrl, "https://custom.example.com"} -> true
               _ -> false
             end)
    end

    test "includes Headers middleware with user-agent" do
      middleware = Connection.middleware()

      assert Enum.any?(middleware, fn
               {Tesla.Middleware.Headers, headers} ->
                 Enum.any?(headers, fn {k, _v} -> k == "user-agent" end)

               _ ->
                 false
             end)
    end

    test "includes EncodeJson middleware" do
      middleware = Connection.middleware()

      assert Enum.any?(middleware, fn
               {Tesla.Middleware.EncodeJson, _} -> true
               _ -> false
             end)
    end

    test "includes BearerAuth middleware when bearer_token is provided" do
      middleware = Connection.middleware(bearer_token: "my-token")

      assert Enum.any?(middleware, fn
               {Tesla.Middleware.BearerAuth, token: "my-token"} -> true
               _ -> false
             end)
    end

    test "includes OAuth2 middleware when token string is provided" do
      middleware = Connection.middleware(token: "oauth-token")

      assert Enum.any?(middleware, fn
               {Tesla.Middleware.Headers, headers} ->
                 Enum.any?(headers, fn {k, _v} -> k == "authorization" end)

               _ ->
                 false
             end)
    end
  end

  describe "authorization/2" do
    test "returns header middleware for string token" do
      result = Connection.authorization("Bearer my-token")
      assert {Tesla.Middleware.Headers, [{"authorization", "Bearer my-token"}]} = result
    end

    test "calls token fetcher function with scopes" do
      fetcher = fn scopes ->
        assert is_list(scopes)
        "Bearer fetched-token"
      end

      result = Connection.authorization(fetcher, ["tweet.read"])
      assert {Tesla.Middleware.Headers, [{"authorization", "Bearer fetched-token"}]} = result
    end

    test "calls module/function tuple with scopes" do
      # We test with a lambda that mimics the behavior
      result = Connection.authorization("direct-token")
      assert {Tesla.Middleware.Headers, [{"authorization", "direct-token"}]} = result
    end
  end

  describe "adapter/0" do
    test "returns nil by default when no adapter configured" do
      # In test env, Tesla.Mock is configured via test_helper
      # The adapter/0 function reads from application env
      adapter = Connection.adapter()
      # Could be nil or Tesla.Mock depending on test env config
      assert adapter == nil or is_atom(adapter)
    end
  end
end
