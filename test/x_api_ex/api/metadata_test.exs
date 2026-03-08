defmodule XApiEx.Api.MetadataTest do
  @moduledoc """
  Tests for `XApiEx.Api.Metadata` — creating media metadata.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "create_media_metadata/2" do
    test "sends POST to /2/media/metadata", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :post
        assert env.url == "https://api.x.com/2/media/metadata"
        %Tesla.Env{status: 200, body: Fixtures.create_metadata_200()}
      end)

      assert {:ok, %XApiEx.Model.CreateMediaMetadata200Response{}} =
               XApiEx.Api.Metadata.create_media_metadata(conn)
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.Metadata.create_media_metadata(conn)
    end
  end
end
