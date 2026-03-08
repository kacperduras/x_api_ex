defmodule XApiEx.Api.Metadata do
  @moduledoc """
  API calls for all endpoints tagged `Metadata`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Create Media Metadata
  Allows an authenticated user to add metadata to uploaded media.  You can use this endpoint to attach alt text to media. The `media_id` parameter specifies the media, while the `alt_text` contains the descriptive text.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/media/metadata-create).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (CreateMediaMetadataRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.CreateMediaMetadata200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec create_media_metadata(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.CreateMediaMetadata200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def create_media_metadata(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/media/metadata")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.CreateMediaMetadata200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
