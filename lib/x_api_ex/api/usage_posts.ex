defmodule XApiEx.Api.UsagePosts do
  @moduledoc """
  API calls for all endpoints tagged `UsagePosts`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Get Posts Usage
  Returns the Posts usage at a project and client app level  For full details, see the [API reference](https://docs.x.com/x-api/usage/post-usage) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"usage.fields"` (String.t): Comma-separated list of fields for the usage object.  Allowed values: cap_reset_day,daily_client_app_usage,daily_project_usage,project_cap,project_id,project_usage  Default values: cap_reset_day,project_cap,project_id,project_usage
    - `:days` (String.t): Number of days for which you want the usage for

  ### Returns

  - `{:ok, XApiEx.Model.GetPostsUsage200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_posts_usage(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.GetPostsUsage200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def get_posts_usage(connection, opts \\ []) do
    optional_params = %{
      :"usage.fields" => :query,
      :days => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/usage/tweets")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.GetPostsUsage200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
