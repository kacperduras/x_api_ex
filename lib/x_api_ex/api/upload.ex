defmodule XApiEx.Api.Upload do
  @moduledoc """
  API calls for all endpoints tagged `Upload`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Media Upload STATUS
  Allows an authenticated user to check the processing status of uploaded media.  You can use this endpoint to monitor the status of video. The `media_id` parameter is from the the uploaded media, and the `command=STATUS` parameter retrieves information about whether the processing status is pending, in progress, or complete.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/media/media-upload-status).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:media_id` (String.t): Media id for the requested media upload status.
    - `:command` (String.t): The command for the media upload request.

  ### Returns

  - `{:ok, XApiEx.Model.MediaUploadStatus200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec media_upload_status(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.MediaUploadStatus200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def media_upload_status(connection, opts \\ []) do
    optional_params = %{
      :media_id => :query,
      :command => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/media/upload")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.MediaUploadStatus200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Upload Media
  Allows an authenticated user to upload media.  You can use this endpoint to upload videos before attaching them to Tweets. The `media_type` parameter specifies the type of media, while the `command` parameter controls the upload process by initializing, appending and finalizing the upload.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/media/media-upload).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:media_type` (String.t): Specifies the MIME type of the media being uploaded
    - `:command` (String.t): command : Specifies the current step in the media upload process. Allowed values: INIT, APPEND, FINALIZE, STATUS
    - `:media` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.UploadMedia200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec upload_media(Tesla.Env.client(), keyword()) ::
          {:ok, nil}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UploadMedia202Response.t()}
          | {:ok, XApiEx.Model.UploadMedia200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def upload_media(connection, opts \\ []) do
    optional_params = %{
      :media_type => :query,
      :command => :query,
      :media => :form
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/media/upload")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UploadMedia200Response},
      {202, XApiEx.Model.UploadMedia202Response},
      {204, false},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
