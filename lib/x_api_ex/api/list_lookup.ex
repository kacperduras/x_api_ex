defmodule XApiEx.Api.ListLookup do
  @moduledoc """
  API calls for all endpoints tagged `ListLookup`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

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
end
