defmodule XApiEx.Api.SubtitlesTest do
  @moduledoc """
  Tests for `XApiEx.Api.Subtitles` — creating and deleting media subtitles.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "create_media_subtitles/2" do
    test "sends POST to /2/media/subtitles", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/media/subtitles"
        %Tesla.Env{status: 200, body: Fixtures.create_subtitles_200()}
      end)

      assert {:ok, %XApiEx.Model.CreateMediaSubtitles200Response{}} =
               XApiEx.Api.Subtitles.create_media_subtitles(conn)
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Subtitles.create_media_subtitles(conn)
    end
  end

  describe "delete_media_subtitles/2" do
    test "sends DELETE to /2/media/subtitles", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/media/subtitles"
        %Tesla.Env{status: 200, body: ~s({"data":{}})}
      end)

      assert {:ok, _} = XApiEx.Api.Subtitles.delete_media_subtitles(conn)
    end
  end
end
