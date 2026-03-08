defmodule XApiEx.Api.PinnedLists do
  @moduledoc """
  API calls for all endpoints tagged `PinnedLists`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

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
