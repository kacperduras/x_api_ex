defmodule XApiEx.Api.ManagePosts do
  @moduledoc """
  API calls for all endpoints tagged `ManagePosts`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Create a Post
  Allows an authenticated user to create a Post.  You can add parameters to post polls, quote Posts, Post with reply settings, and Post to Super Followers in addition to other features.  For full details, see the [API reference](https://docs.x.com/x-api/posts/creation-of-a-post) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (CreateAPostRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.CreateAPost200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec create_a_post(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.CreateAPost200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def create_a_post(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/tweets")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.CreateAPost200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Delete a Post
  Allows an authenticated user to delete a Post.  For full details, see the [API reference](https://docs.x.com/x-api/posts/post-delete-by-post-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the Post you wish to delete
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.DeleteAPost200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec delete_a_post(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.DeleteAPost200Response.t()}
          | {:error, Tesla.Env.t()}
  def delete_a_post(connection, id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/2/tweets/#{id}")
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
