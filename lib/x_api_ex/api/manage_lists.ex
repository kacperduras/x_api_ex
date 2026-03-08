defmodule XApiEx.Api.ManageLists do
  @moduledoc """
  API calls for all endpoints tagged `ManageLists`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

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
end
