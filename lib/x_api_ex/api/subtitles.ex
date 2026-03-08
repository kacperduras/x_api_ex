defmodule XApiEx.Api.Subtitles do
  @moduledoc """
  API calls for all endpoints tagged `Subtitles`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

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
end
