defmodule XApiEx.Api.MediaTest do
  @moduledoc """
  Tests for `XApiEx.Api.Media` — uploading media files and managing metadata and subtitles.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "upload_media/2" do
    test "sends POST to /2/media/upload", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/media/upload"
        %Tesla.Env{status: 200, body: Fixtures.upload_finalize_response()}
      end)

      assert {:ok, _} = XApiEx.Api.Media.upload_media(conn)
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Media.upload_media(conn)
    end
  end

  describe "media_upload_status/2" do
    test "sends GET to /2/media/upload", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :get
        assert env.url == "https://api.x.com/2/media/upload"
        %Tesla.Env{status: 200, body: Fixtures.upload_finalize_response()}
      end)

      assert {:ok, _} = XApiEx.Api.Media.media_upload_status(conn)
    end
  end

  describe "create_media_metadata/2" do
    test "sends POST to /2/media/metadata", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/media/metadata"
        %Tesla.Env{status: 200, body: Fixtures.create_metadata_200()}
      end)

      assert {:ok, _} = XApiEx.Api.Media.create_media_metadata(conn)
    end
  end

  describe "create_media_subtitles/2" do
    test "sends POST to /2/media/subtitles", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/media/subtitles"
        %Tesla.Env{status: 200, body: Fixtures.create_subtitles_200()}
      end)

      assert {:ok, _} = XApiEx.Api.Media.create_media_subtitles(conn)
    end
  end

  describe "delete_media_subtitles/2" do
    test "sends DELETE to /2/media/subtitles", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/media/subtitles"
        %Tesla.Env{status: 200, body: ~s({"data":{}})}
      end)

      assert {:ok, _} = XApiEx.Api.Media.delete_media_subtitles(conn)
    end
  end
end
