defmodule XApiEx.Api.SearchPosts do
  @moduledoc """
  API calls for all endpoints tagged `SearchPosts`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Full-archive search
  Search across the complete history of public Posts matching a search query; since the first Post was created in March 2006.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/posts/search/api-reference/get-posts-search-all) for this endpoint.  **NOTE** this endpoint requires access via the Academic Research product track  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:query` (String.t): Required. Query for matching Tweets. Up to 1024 characters.
    - `:start_time` (String.t): The oldest UTC timestamp from which the Tweets will be provided. YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339).
    - `:end_time` (String.t): The newest, most recent UTC timestamp to which the Tweets will be provided. YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339).
    - `:since_id` (String.t): Returns results with a Tweet ID greater than (that is, more recent than) the specified ID. The ID specified is exclusive and responses will not include it.
    - `:until_id` (String.t): Returns results with a Tweet ID less than (that is, older than) the specified ID. The ID specified is exclusive and responses will not include it.
    - `:max_results` (String.t): The maximum number of search results to be returned by a request. A number between 10 and the system limit (currently 100). By default, a request response will return 10 results.
    - `:next_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,possibly_sensitive,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids 
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id,edit_history_tweet_ids  Default values: none
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,preview_image_url,public_metrics,type,url,width  Default values: media_key,type 
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id, options
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username

  ### Returns

  - `{:ok, XApiEx.Model.SearchResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec full_archive_search(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.SearchResponse.t()}
          | {:error, Tesla.Env.t()}
  def full_archive_search(connection, opts \\ []) do
    optional_params = %{
      :query => :query,
      :start_time => :query,
      :end_time => :query,
      :since_id => :query,
      :until_id => :query,
      :max_results => :query,
      :next_token => :query,
      :"tweet.fields" => :query,
      :expansions => :query,
      :"media.fields" => :query,
      :"place.fields" => :query,
      :"poll.fields" => :query,
      :"user.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/tweets/search/all")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.SearchResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Recent search
  Search for public Posts created in the last 7 days.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/posts/search/api-reference/get-posts-search-recent) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:query` (String.t): Required. Query for matching Tweets. Up to 512 characters.
    - `:start_time` (String.t): The oldest UTC timestamp (from most recent 7 days) from which the Tweets will be provided. YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339).
    - `:end_time` (String.t): The newest, most recent UTC timestamp to which the Tweets will be provided. YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339).
    - `:since_id` (String.t): Returns results with a Tweet ID greater than (that is, more recent than) the specified ID. The ID specified is exclusive and responses will not include it.
    - `:until_id` (String.t): Returns results with a Tweet ID less than (that is, older than) the specified ID. The ID specified is exclusive and responses will not include it.
    - `:max_results` (String.t): The maximum number of search results to be returned by a request. A number between 10 and the system limit (currently 100). By default, a request response will return 10 results.
    - `:next_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id,edit_history_tweet_ids  Default values: none
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width  Default values: media_key,type  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id, options
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username

  ### Returns

  - `{:ok, XApiEx.Model.SearchResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec recent_search(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.SearchResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def recent_search(connection, opts \\ []) do
    optional_params = %{
      :query => :query,
      :start_time => :query,
      :end_time => :query,
      :since_id => :query,
      :until_id => :query,
      :max_results => :query,
      :next_token => :query,
      :"tweet.fields" => :query,
      :expansions => :query,
      :"media.fields" => :query,
      :"place.fields" => :query,
      :"poll.fields" => :query,
      :"user.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/tweets/search/recent")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.SearchResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
