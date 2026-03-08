defmodule XApiEx.Api.Media do
  @moduledoc """
  API calls for all endpoints tagged `Media`.
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

  @doc """
  Create Media Subtitles
  Allows an authenticated user to add subtitles to uploaded media.  You can use this endpoint to provide subtitles for media. The `media_id` parameter identifies the media, while additional parameters define the subtitle language and file content.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/media/subtitle-create).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (CreateMediaSubtitlesRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.CreateMediaSubtitles200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec create_media_subtitles(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.CreateMediaSubtitles200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def create_media_subtitles(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/media/subtitles")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.CreateMediaSubtitles200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Delete Media Subtitles
  Allows an authenticated user to delete subtitles from uploaded media.  You can use this endpoint to remove previously added subtitle information from media. The `media_id` parameter identifies the media, and specify other parameters to delete the subtitle.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/media/subtitle-delete).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (DeleteMediaSubtitlesRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.DeleteAPost200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec delete_media_subtitles(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.DeleteAPost200Response.t()}
          | {:error, Tesla.Env.t()}
  def delete_media_subtitles(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:delete)
      |> url("/2/media/subtitles")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.DeleteAPost200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

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
