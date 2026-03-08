defmodule XApiEx.Api.SearchSpaces do
  @moduledoc """
  API calls for all endpoints tagged `SearchSpaces`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Search Spaces by title
  This endpoint returns Spaces matching the specified keyword query.  For full details, see the [API reference](https://docs.x.com/x-api/spaces/search-for-spaces) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:query` (String.t): Required. A search term. Can be a keyword, hashtag, or mention.
    - `:state` (String.t): Return only Spaces with a specific running status.  Allowed values (specify only one of the following): live,scheduled
    - `:"space.fields"` (String.t): Comma-separated list of fields from the Space object you want to return from your request.  Available fields: host_ids,created_at,creator_id,id,lang,invited_user_ids, participant_count,speaker_ids,started_at,state,title,updated_at, scheduled_start,is_ticketed,ended_at,topic_ids  Default fields: id,state
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Available values: invited_user_ids,speaker_ids,creator_id,host_ids
    - `:"user.fields"` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Available values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:"topic.fields"` (String.t): Comma-separated list of fields from the Space Topics object you want to return from your request . Available values: id,name,description

  ### Returns

  - `{:ok, XApiEx.Model.SpacesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec search_spaces_by_title(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.SpacesResponse.t()}
          | {:error, Tesla.Env.t()}
  def search_spaces_by_title(connection, opts \\ []) do
    optional_params = %{
      :query => :query,
      :state => :query,
      :"space.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query,
      :"topic.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/spaces/search")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.SpacesResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
