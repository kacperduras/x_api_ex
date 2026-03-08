defmodule XApiEx.Api.MutesTest do
  @moduledoc """
  Tests for `XApiEx.Api.Mutes` — muting/unmuting users and listing muted accounts.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "mute_a_user_id/3" do
    test "returns MuteAUserId200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/users/111/muting"} ->
          %Tesla.Env{status: 200, body: Fixtures.mute_user_200()}
      end)

      assert {:ok, %XApiEx.Model.MuteAUserId200Response{}} =
               XApiEx.Api.Mutes.mute_a_user_id(conn, "111")
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Mutes.mute_a_user_id(conn, "111")
    end
  end

  describe "unmute_a_user_id/4" do
    test "sends DELETE to /2/users/:source/muting/:target", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/users/source/muting/target"
        %Tesla.Env{status: 200, body: Fixtures.unmute_user_200()}
      end)

      assert {:ok, %XApiEx.Model.UnmuteAUserId200Response{}} =
               XApiEx.Api.Mutes.unmute_a_user_id(conn, "source", "target")
    end
  end

  describe "mutes_lookup/3" do
    test "returns BlocksLookup200Response on 200 (reused model)", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/users/111/muting"} ->
          %Tesla.Env{status: 200, body: Fixtures.mutes_lookup_200()}
      end)

      assert {:ok, %XApiEx.Model.UsersResponse{data: data}} =
               XApiEx.Api.Mutes.mutes_lookup(conn, "111")

      assert length(data) == 1
    end
  end
end
