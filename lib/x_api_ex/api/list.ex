defmodule XApiEx.Api.List do
  @moduledoc """
  API calls for all endpoints tagged `List`.
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
  Create a list
  Allows the authenticated user to create a new List.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-lists) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (CreateAListRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.CreateAList201Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec create_a_list(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.CreateAList201Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def create_a_list(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/lists")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {201, XApiEx.Model.CreateAList201Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Delete a list
  Allows the authenticated user to delete a list they own.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-lists-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the List you wish to update the metadata of - the List must be owned by the authenticated user
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.DeleteAPost200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec delete_a_list(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.DeleteAPost200Response.t()}
          | {:error, Tesla.Env.t()}
  def delete_a_list(connection, id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/2/lists/#{id}")
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
  Follow a list
  Allows the authenticated user to follow a specified List.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-users-id-followed-lists) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the user you wish to recieve details on which Lists they follow.
  - `opts` (keyword): Optional parameters
    - `:body` (FollowAListRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.FollowAList200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec follow_a_list(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.FollowAList200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def follow_a_list(connection, id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/users/#{id}/followed_lists")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.FollowAList200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Follower lookup
  This endpoint returns follower details from the List specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/get-lists-id-followers) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the List you wish to recieve follower details on.
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
  @spec follower_lookup(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.UsersResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def follower_lookup(connection, id, opts \\ []) do
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
      |> url("/2/lists/#{id}/followers")
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
  List by ID
  This endpoint returns details about the List specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-lists-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the List you wish to update the metadata of - the List must be owned by the authenticated user
  - `opts` (keyword): Optional parameters
    - `:"list.fields"` (String.t): Comma-separated fields for the List object. Allowed values: created_at, follower_count, member_count, private, description, owner_id Default values: id,name
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: owner_id Default value: none
    - `:"user.fields"` (String.t): Comma-separated list of fields for the User object. Expansion required. Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld Default values: id,name,username

  ### Returns

  - `{:ok, XApiEx.Model.ListResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec list_by_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ListResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def list_by_id(connection, id, opts \\ []) do
    optional_params = %{
      :"list.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/lists/#{id}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.ListResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  List Posts lookup
  This endpoint returns all Posts from a List specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/list-posts/api-reference/get-lists-id-posts) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the List you wish to recieve Post details on.
  - `opts` (keyword): Optional parameters
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics 
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: author_id Default value: none
    - `:"user.fields"` (String.t): Comma-separated list of fields for the User object. Expansion required. Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld Default values: id,name,username
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 1 through 100. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:""` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.PostsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec list_posts_lookup(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PostsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def list_posts_lookup(connection, id, opts \\ []) do
    optional_params = %{
      :"tweet.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"" => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/lists/#{id}/tweets")
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
  Pin a list
  Allows the authenticated user to pin a specified List.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-users-id-pinned-lists) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The user ID whose pinned Lists you would like to retrieve. The user’s ID must correspond to the user ID of the authenticating user, meaning that you must pass the Access Tokens associated with the user ID when authenticating your request.
  - `opts` (keyword): Optional parameters
    - `:body` (PinAListRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.PinAList200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec pin_a_list(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PinAList200Response.t()}
          | {:error, Tesla.Env.t()}
  def pin_a_list(connection, id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/users/#{id}/pinned_lists")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.PinAList200Response},
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
  Unfollow a list
  Allows the authenticated user to unfollow a specified List.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-users-id-followed-lists-list_id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the authenticated user 
  - `list_id` (String.t): Required. The ID of the List you wish to unfollow 
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.UnfollowAUserId200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec unfollow_a_list(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UnfollowAUserId200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def unfollow_a_list(connection, id, list_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/2/users/#{id}/followed_lists/#{list_id}")
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
  Unpin a list
  Allows the authenticated user to unpin a specified List.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-users-id-pinned-lists-list_id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the authenticated user
  - `list_id` (String.t): Required. The ID of the List you wish to unpin
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.UnpinAList200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec unpin_a_list(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UnpinAList200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def unpin_a_list(connection, id, list_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/2/users/#{id}/pinned_lists/#{list_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UnpinAList200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Update a list
  Allows the authenticated user to update a List they own.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/put-lists-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the List you wish to update the metadata of - the List must be owned by the authenticated user
  - `opts` (keyword): Optional parameters
    - `:body` (UpdateAListRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.UpdateAList200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec update_a_list(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UpdateAList200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def update_a_list(connection, id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:put)
      |> url("/2/lists/#{id}")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UpdateAList200Response},
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

  @doc """
  User owned Lists
  This endpoint returns details on user owned Lists specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-users-id-owned_lists) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the user you wish to recieve details on Lists they own.
  - `opts` (keyword): Optional parameters
    - `:"list.fields"` (String.t): Comma-separated fields for the List object. Allowed values: created_at, follower_count, member_count, private, description, owner_id Default values: id,name
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: owner_id Default value: none
    - `:"user.fields"` (String.t): Comma-separated list of fields for the User object. Expansion required. Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld Default values: id,name,username
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 1 through 100. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:""` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.ListsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec user_owned_lists(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ListsResponse.t()}
          | {:error, Tesla.Env.t()}
  def user_owned_lists(connection, id, opts \\ []) do
    optional_params = %{
      :"list.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"" => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}/owned_lists")
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

  @doc """
  User's followed Lists
  This endpoint returns details on Lists a user follows specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/get-users-id-followed_lists) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the user you wish to recieve details on which Lists they follow.
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
  @spec user_s_followed_lists(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ListsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def user_s_followed_lists(connection, id, opts \\ []) do
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
      |> url("/2/users/#{id}/followed_lists")
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

  @doc """
  User's pinned Lists
  This endpoint returns details on a user's pinned Lists specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/get-users-id-pinned_lists) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The user ID whose pinned Lists you would like to retrieve. The user’s ID must correspond to the user ID of the authenticating user, meaning that you must pass the Access Tokens associated with the user ID when authenticating your request.
  - `opts` (keyword): Optional parameters
    - `:"list.fields"` (String.t): Comma-separated fields for the List object. Allowed values: created_at, follower_count, member_count, private, description, owner_id Default values: id,name
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: owner_id Default value: none
    - `:"user.fields"` (String.t): Comma-separated list of fields for the User object. Expansion required. Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld Default values: id,name,username
    - `:""` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.ListsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec user_s_pinned_lists(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ListsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def user_s_pinned_lists(connection, id, opts \\ []) do
    optional_params = %{
      :"list.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query,
      :"" => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}/pinned_lists")
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
