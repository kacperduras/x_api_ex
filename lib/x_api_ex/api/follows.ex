defmodule XApiEx.Api.Follows do
  @moduledoc """
  API calls for all endpoints tagged `Follows`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Follow a user ID
  Allows a user ID to follow another user.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/post-users-source_user_id-following) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the user who wishes to follow an account. The ID must belong to the authenticating user.  In Postman, you can leave the `id` field empty to let the collection automatically populate it with the user ID of the user in the current environment.
  - `opts` (keyword): Optional parameters
    - `:body` (FollowAUserIdRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.FollowAUserId200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec follow_a_user_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.FollowAUserId200Response.t()}
          | {:error, Tesla.Env.t()}
  def follow_a_user_id(connection, id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/users/#{id}/following")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.FollowAUserId200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Followers of user ID
  Returns a list of users who are followers of the specified user ID.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/get-users-id-followers) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. Enter a single user ID.
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated fields for the user object. Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: pinned_tweet_id Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required. Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,source,text,withheld Default values: id,text OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 10 through 1000. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.

  ### Returns

  - `{:ok, XApiEx.Model.UsersResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec followers_of_user_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UsersResponse.t()}
          | {:error, Tesla.Env.t()}
  def followers_of_user_id(connection, id, opts \\ []) do
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
      |> url("/2/users/#{id}/followers")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UsersResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Unfollow a user ID
  Allows a user ID to unfollow another user.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/delete-users-source_user_id-following) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `source_user_id` (String.t): The ID of the user who wishes to follow an account. The ID must belong to the authenticating user.  In Postman, you can leave the `source_user_id` field empty to let the collection automatically populate it with the user ID of the user in the current environment.
  - `target_user_id` (String.t): The ID of the user to unfollow.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.UnfollowAUserId200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec unfollow_a_user_id(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UnfollowAUserId200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def unfollow_a_user_id(connection, source_user_id, target_user_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/2/users/#{source_user_id}/following/#{target_user_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UnfollowAUserId200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Users a user ID is following
  Returns a list of users the specified user ID is following.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/get-users-id-following) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the user who wishes to follow an account. The ID must belong to the authenticating user.  In Postman, you can leave the `id` field empty to let the collection automatically populate it with the user ID of the user in the current environment.
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated fields for the user object. Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,witheld Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: pinned_tweet_id Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required. Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,source,text,withheld Default values: id,text OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 10 through 1000. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.

  ### Returns

  - `{:ok, XApiEx.Model.UsersResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec users_a_user_id_is_following(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UsersResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def users_a_user_id_is_following(connection, id, opts \\ []) do
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
      |> url("/2/users/#{id}/following")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UsersResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
