defmodule XApiEx.Api.ListMembers do
  @moduledoc """
  API calls for all endpoints tagged `ListMembers`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Add a member
  Allows the authenticated user to add a member to a List they own.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-lists-id-members) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the List you wish to recieve member details on.
  - `opts` (keyword): Optional parameters
    - `:body` (AddAMemberRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.AddAMember200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec add_a_member(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.AddAMember200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def add_a_member(connection, id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/lists/#{id}/members")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.AddAMember200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Members lookup
  This endpoint returns member details from the List specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-lists-id-members) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the List you wish to recieve member details on.
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated list of fields for the User object. Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld Default values: id,name,username
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required. Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld Default values: id,text OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics 
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: pinned_tweet_id Default value: none
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 1 through 100. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:""` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.UsersResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec members_lookup(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UsersResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def members_lookup(connection, id, opts \\ []) do
    optional_params = %{
      :"user.fields" => :query,
      :"tweet.fields" => :query,
      :expansions => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"" => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/lists/#{id}/members")
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
  Remove a member
  Allows the authenticated user to remove a member from a List they own.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-lists-id-members-user_id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the List you wish to remove a user from - the List must be owned by the authenticated user
  - `user_id` (String.t): Required. The ID of the user you wish to remove from the list
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.RemoveAMember200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec remove_a_member(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.RemoveAMember200Response.t()}
          | {:error, Tesla.Env.t()}
  def remove_a_member(connection, id, user_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/2/lists/#{id}/members/#{user_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.RemoveAMember200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  User memberships
  This endpoint returns details on Lists a user is a member of specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-users-id-list_memberships) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the user you wish to recieve membership details on.
  - `opts` (keyword): Optional parameters
    - `:"list.fields"` (String.t): Comma-separated fields for the List object. Allowed values: created_at, follower_count, member_count, private, description, owner_id Default values: id,name
    - `:"user.fields"` (String.t): Comma-separated list of fields for the User object. Expansion required. Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: owner_id Default value: none
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 1 through 100. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:""` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.ListsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec user_memberships(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ListsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def user_memberships(connection, id, opts \\ []) do
    optional_params = %{
      :"list.fields" => :query,
      :"user.fields" => :query,
      :expansions => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"" => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}/list_memberships")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.ListsResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
