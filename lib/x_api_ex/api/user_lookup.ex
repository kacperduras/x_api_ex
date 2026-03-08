defmodule XApiEx.Api.UserLookup do
  @moduledoc """
  API calls for all endpoints tagged `UserLookup`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Authenticated User Lookup
  This endpoint returns the information about an authorized user.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-me) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated fields for the user object.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed value: pinned_tweet_id  Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld  Default values: id,text  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics

  ### Returns

  - `{:ok, XApiEx.Model.UsersResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec authenticated_user_lookup(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, nil}
          | {:ok, XApiEx.Model.UsersResponse.t()}
          | {:ok, XApiEx.Model.UsersByUsername400Response.t()}
          | {:error, Tesla.Env.t()}
  def authenticated_user_lookup(connection, opts \\ []) do
    optional_params = %{
      :"user.fields" => :query,
      :expansions => :query,
      :"tweet.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/me")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UsersResponse},
      {400, XApiEx.Model.UsersByUsername400Response},
      {401, XApiEx.Model.ApiError},
      {429, false}
    ])
  end

  @doc """
  User by ID
  This endpoint returns details about a user by ID.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. Enter a single user ID.
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated fields for the user object.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed value: pinned_tweet_id  Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld  Default values: id,text  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics

  ### Returns

  - `{:ok, XApiEx.Model.UserResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec user_by_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, nil}
          | {:ok, XApiEx.Model.UserResponse.t()}
          | {:error, Tesla.Env.t()}
  def user_by_id(connection, id, opts \\ []) do
    optional_params = %{
      :"user.fields" => :query,
      :expansions => :query,
      :"tweet.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UserResponse},
      {401, XApiEx.Model.ApiError},
      {429, false}
    ])
  end

  @doc """
  User by Username
  This endpoint returns details about a user by username.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by-username-username) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `username` (String.t): Required. Enter a single X username (handle).
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated fields for the user object.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed value: pinned_tweet_id  Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,source,text,withheld  Default values: id,text  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics

  ### Returns

  - `{:ok, XApiEx.Model.UserResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec user_by_username(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, nil}
          | {:ok, XApiEx.Model.UserResponse.t()}
          | {:error, Tesla.Env.t()}
  def user_by_username(connection, username, opts \\ []) do
    optional_params = %{
      :"user.fields" => :query,
      :expansions => :query,
      :"tweet.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/by/username/#{username}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UserResponse},
      {401, XApiEx.Model.ApiError},
      {429, false}
    ])
  end

  @doc """
  Users by ID
  This endpoint returns details about up to 100 users by ID.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:ids` (String.t): Required. Enter up to 100 comma-separated user IDs.
    - `:"user.fields"` (String.t): Comma-separated fields for the user object.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed value: pinned_tweet_id  Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld  Default values: id,text  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics

  ### Returns

  - `{:ok, XApiEx.Model.UsersResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec users_by_id(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UsersResponse.t()}
          | {:ok, XApiEx.Model.UsersById400Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def users_by_id(connection, opts \\ []) do
    optional_params = %{
      :ids => :query,
      :"user.fields" => :query,
      :expansions => :query,
      :"tweet.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UsersResponse},
      {400, XApiEx.Model.UsersById400Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Users by Username
  This endpoint returns details about up to 100 users specified by username.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:usernames` (String.t): Required. Enter up to 100 comma-separated usernames.
    - `:"user.fields"` (String.t): Comma-separated fields for the user object.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed value: pinned_tweet_id  Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld  Default values: id,text  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics

  ### Returns

  - `{:ok, XApiEx.Model.UsersResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec users_by_username(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, nil}
          | {:ok, XApiEx.Model.UsersResponse.t()}
          | {:ok, XApiEx.Model.UsersByUsername400Response.t()}
          | {:error, Tesla.Env.t()}
  def users_by_username(connection, opts \\ []) do
    optional_params = %{
      :usernames => :query,
      :"user.fields" => :query,
      :expansions => :query,
      :"tweet.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/by")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UsersResponse},
      {400, XApiEx.Model.UsersByUsername400Response},
      {401, XApiEx.Model.ApiError},
      {429, false}
    ])
  end
end
