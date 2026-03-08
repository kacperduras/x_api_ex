defmodule XApiEx.Api.UploadTest do
  @moduledoc """
  Tests for `XApiEx.Api.Upload` — uploading media files and checking upload status.
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

      assert {:ok, _} = XApiEx.Api.Upload.upload_media(conn)
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Upload.upload_media(conn)
    end
  end

  describe "media_upload_status/2" do
    test "sends GET to /2/media/upload", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :get
        assert env.url == "https://api.x.com/2/media/upload"
        %Tesla.Env{status: 200, body: Fixtures.upload_finalize_response()}
      end)

      assert {:ok, _} = XApiEx.Api.Upload.media_upload_status(conn)
    end
  end
end
