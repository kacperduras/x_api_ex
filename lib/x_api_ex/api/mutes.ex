defmodule XApiEx.Api.Mutes do
  @moduledoc """
  API calls for all endpoints tagged `Mutes`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Mute a user ID
  Allows a user ID to mute another user.  For full details, see the [API reference](https://docs.x.com/x-api/users/mute-user-by-user-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The user ID whose muted users you would like to retrieve. The user’s ID must correspond to the user ID of the authenticating user, meaning that you must pass the Access Tokens associated with the user ID when authenticating your request.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.MuteAUserId200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec mute_a_user_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.MuteAUserId200Response.t()}
          | {:error, Tesla.Env.t()}
  def mute_a_user_id(connection, id, _opts \\ []) do
    request =
      %{}
      |> method(:post)
      |> url("/2/users/#{id}/muting")
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.MuteAUserId200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Mutes lookup
  Returns a list of users who are muted by the specified user ID.  For full details, see the [API reference](https://docs.x.com/x-api/users/returns-user-objects-that-are-muted-by-the-provided-user-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The user ID whose muted users you would like to retrieve. The user’s ID must correspond to the user ID of the authenticating user, meaning that you must pass the Access Tokens associated with the user ID when authenticating your request.
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated fields for the user object. Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: pinned_tweet_id Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required. Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,source,text,withheld Default values: id,text OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 1 through 1000. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:""` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.UsersResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec mutes_lookup(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UsersResponse.t()}
          | {:error, Tesla.Env.t()}
  def mutes_lookup(connection, id, opts \\ []) do
    optional_params = %{
      :"user.fields" => :query,
      :expansions => :query,
      :"tweet.fields" => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"" => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}/muting")
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
  Unmute a user ID
  Allows a user ID to unmute another user.  For full details, see the [API reference](https://docs.x.com/x-api/users/unmute-user-by-user-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `source_user_id` (String.t): The ID of the user who wishes to unmute an account. The ID must belong to the authenticating user.  In Postman, you can leave the `source_user_id` field empty to let the collection automatically populate it with the user ID of the user in the current environment.
  - `target_user_id` (String.t): The ID of the user to unmute.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.UnmuteAUserId200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec unmute_a_user_id(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UnmuteAUserId200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def unmute_a_user_id(connection, source_user_id, target_user_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/2/users/#{source_user_id}/muting/#{target_user_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UnmuteAUserId200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
