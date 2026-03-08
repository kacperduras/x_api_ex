defmodule XApiEx.Api.PostCounts do
  @moduledoc """
  API calls for all endpoints tagged `PostCounts`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Full-archive Post counts
  Search across the complete history of public Posts matching a search query; since the first Post was created in March 2006.  For full details, see the [API reference](https://docs.x.com/x-api/posts/full-archive-search-counts) for this endpoint.  **NOTE** this endpoint requires access via the Academic Research product track  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:start_time` (String.t): The oldest UTC timestamp from which the Tweets will be provided. YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339).
    - `:end_time` (String.t): The newest, most recent UTC timestamp to which the Tweets will be provided. YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339).
    - `:since_id` (String.t): Returns results with a Tweet ID greater than (that is, more recent than) the specified ID. The ID specified is exclusive and responses will not include it.
    - `:until_id` (String.t): Returns results with a Tweet ID less than (that is, older than) the specified ID. The ID specified is exclusive and responses will not include it.
    - `:next_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:granularity` (String.t): This is the granularity that you want the timeseries count data to be grouped by. Possible values are day, hour or minute. The default granularity, if not specified is hour.
    - `:query` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.PostCountsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec full_archive_post_counts(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PostCountsResponse.t()}
          | {:error, Tesla.Env.t()}
  def full_archive_post_counts(connection, opts \\ []) do
    optional_params = %{
      :start_time => :query,
      :end_time => :query,
      :since_id => :query,
      :until_id => :query,
      :next_token => :query,
      :granularity => :query,
      :query => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/tweets/counts/all")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.PostCountsResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Recent Post counts
  Search for public Posts created in the last 7 days.  For full details, see the [API reference](https://docs.x.com/x-api/posts/recent-search-counts) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:query` (String.t): Required. Query for matching Tweets. Up to 512 characters.
    - `:start_time` (String.t): The oldest UTC timestamp (from most recent 7 days) from which the Tweets will be provided. YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339).
    - `:end_time` (String.t): The newest, most recent UTC timestamp to which the Tweets will be provided. YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339).
    - `:since_id` (String.t): Returns results with a Tweet ID greater than (that is, more recent than) the specified ID. The ID specified is exclusive and responses will not include it.
    - `:until_id` (String.t): Returns results with a Tweet ID less than (that is, older than) the specified ID. The ID specified is exclusive and responses will not include it.
    - `:granularity` (String.t): This is the granularity that you want the timeseries count data to be grouped by. Possible values are day, hour or minute. The default granularity, if not specified is hour.

  ### Returns

  - `{:ok, XApiEx.Model.PostCountsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec recent_post_counts(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PostCountsResponse.t()}
          | {:error, Tesla.Env.t()}
  def recent_post_counts(connection, opts \\ []) do
    optional_params = %{
      :query => :query,
      :start_time => :query,
      :end_time => :query,
      :since_id => :query,
      :until_id => :query,
      :granularity => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/tweets/counts/recent")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.PostCountsResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
