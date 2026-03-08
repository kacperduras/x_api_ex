defmodule XApiEx.Api.Bookmarks do
  @moduledoc """
  API calls for all endpoints tagged `Bookmarks`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Bookmark a Post
  Allows an authenticated user to like a Post.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/posts/bookmarks/api-reference/post-users-user_id-bookmarks) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. User ID of the user to request liked Posts for.
  - `opts` (keyword): Optional parameters
    - `:body` (BookmarkAPostRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.BookmarkAPost200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec bookmark_a_post(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.BookmarkAPost200Response.t()}
          | {:error, Tesla.Env.t()}
  def bookmark_a_post(connection, id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/users/#{id}/bookmarks")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.BookmarkAPost200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Bookmarked Posts
  Returns a list of Posts that have been bookmarked by a specified user ID.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/posts/bookmarks/api-reference/get-users-id-bookmarks) for this endpoint.  [Sign up](https://t.co/signup) for the X API.

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. User ID of the user to request liked Posts for.
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated fields for the user object. Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: pinned_tweet_id Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required. Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 1 through 100. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.

  ### Returns

  - `{:ok, XApiEx.Model.PostsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec bookmarked_posts(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PostsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def bookmarked_posts(connection, id, opts \\ []) do
    optional_params = %{
      :"user.fields" => :query,
      :expansions => :query,
      :"tweet.fields" => :query,
      :max_results => :query,
      :pagination_token => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}/bookmarks")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.PostsResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Remove a Bookmark
  Allows an authenticated user to unlike a Post.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/posts/likes/api-reference/delete-users-user_id-likes) for this endpoint.  [Sign up](https://t.co/signup) for the X API.

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the user who wishes to remove a Bookmark. The ID must belong to the authenticated user.
  - `tweet_id` (String.t): The ID of the Post to be removed from Bookmarks
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.BookmarkAPost200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec remove_a_bookmark(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.BookmarkAPost200Response.t()}
          | {:error, Tesla.Env.t()}
  def remove_a_bookmark(connection, id, tweet_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/2/users/#{id}/bookmarks/#{tweet_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.BookmarkAPost200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
