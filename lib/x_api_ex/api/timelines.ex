defmodule XApiEx.Api.Timelines do
  @moduledoc """
  API calls for all endpoints tagged `Timelines`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Reverse chronological home timeline by ID
  Allows you to retrieve a collection of the most recent Posts and Reposts posted by you or a user you follow. This endpoint can return every Post created on a timeline over the last 7 days and the most recent 800 regardless of the creation date.  For full details, see the [API reference](https://docs.x.com/x-api/posts/user-home-timeline-by-user-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:max_results` (String.t): Specifies the number of Tweets to try and retrieve, up to a maximum of 100 per distinct request.   Retweets and replies are included in the count, even if `exclude=retweets,replies` are supplied.   By default, 10 results are returned if this parameter is not supplied. The minimum permitted value is 5. 
    - `:start_time` (String.t): YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339). The oldest or earliest UTC timestamp from which the Tweets will be provided. Only the 3200 most recent Tweets are available. Timestamp is in second granularity and is inclusive (i.e. 12:00:01 includes the first second of the minute). Minimum allowable time is 2010-11-06T00:00:00Z
    - `:end_time` (String.t): YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339). The oldest or earliest UTC timestamp from which the Tweets will be provided. Only the 3200 most recent Tweets are available. Timestamp is in second granularity and is inclusive (i.e. 12:00:01 includes the first second of the minute). Minimum allowable time is 2010-11-06T00:00:00Z
    - `:since_id` (String.t): Returns results with an ID greater than (that is, more recent than) the specified ID. Only the 3200 most recent Tweets are available. The result will exclude the `since_id`. If the limit of Tweets has occurred since the `since_id`, the `since_id` will be forced to the oldest ID available.
    - `:until_id` (String.t): Returns results with an ID less less than (that is, older than) the specified ID. Only the 3200 most recent Tweets are available. The result will exclude the `until_id`. If the limit of Tweets has occurred since the `until_id`, the `until_id` will be forced to the most recent ID available.
    - `:pagination_token` (String.t): This parameter is used to move forwards or backwards through pages of results, based on the value of the `next_token` or `previous_token` in the response. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id,edit_history_tweet_ids  Default values: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width  Default values: media_key,type
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id, options
    - `:""` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.PostsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec reverse_chronological_home_timeline_by_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PostsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def reverse_chronological_home_timeline_by_id(connection, id, opts \\ []) do
    optional_params = %{
      :max_results => :query,
      :start_time => :query,
      :end_time => :query,
      :since_id => :query,
      :until_id => :query,
      :pagination_token => :query,
      :expansions => :query,
      :"tweet.fields" => :query,
      :"user.fields" => :query,
      :"media.fields" => :query,
      :"place.fields" => :query,
      :"poll.fields" => :query,
      :"" => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}/timelines/reverse_chronological")
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
  User mention timeline by ID
  Allows you to retrieve a collection of the most recent Posts and Reposts posted by you or a user you follow. This endpoint returns up to the last 3200 Tweets.  For full details, see the [API reference](https://docs.x.com/x-api/posts/user-mention-timeline-by-user-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. Enter a single user ID.
  - `opts` (keyword): Optional parameters
    - `:max_results` (String.t): Specifies the number of Tweets to try and retrieve, up to a maximum of 100 per distinct request.   Retweets and replies are included in the count, even if `exclude=retweets,replies` are supplied.   By default, 10 results are returned if this parameter is not supplied. The minimum permitted value is 5. 
    - `:start_time` (String.t): YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339). The oldest or earliest UTC timestamp from which the Tweets will be provided. Only the 3200 most recent Tweets are available. Timestamp is in second granularity and is inclusive (i.e. 12:00:01 includes the first second of the minute). Minimum allowable time is 2010-11-06T00:00:00Z
    - `:end_time` (String.t): YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339). The oldest or earliest UTC timestamp from which the Tweets will be provided. Only the 3200 most recent Tweets are available. Timestamp is in second granularity and is inclusive (i.e. 12:00:01 includes the first second of the minute). Minimum allowable time is 2010-11-06T00:00:00Z
    - `:since_id` (String.t): Returns results with an ID greater than (that is, more recent than) the specified ID. Only the 3200 most recent Tweets are available. The result will exclude the `since_id`. If the limit of Tweets has occurred since the `since_id`, the `since_id` will be forced to the oldest ID available.
    - `:until_id` (String.t): Returns results with an ID less less than (that is, older than) the specified ID. Only the 3200 most recent Tweets are available. The result will exclude the `until_id`. If the limit of Tweets has occurred since the `until_id`, the `until_id` will be forced to the most recent ID available.
    - `:pagination_token` (String.t): This parameter is used to move forwards or backwards through pages of results, based on the value of the `next_token` or `previous_token` in the response. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id,edit_history_tweet_ids  Default values: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids  Default values: id,text,edit_history_tweet_ids
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width  Default values: media_key,type
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id, options

  ### Returns

  - `{:ok, XApiEx.Model.PostsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec user_mention_timeline_by_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PostsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def user_mention_timeline_by_id(connection, id, opts \\ []) do
    optional_params = %{
      :max_results => :query,
      :start_time => :query,
      :end_time => :query,
      :since_id => :query,
      :until_id => :query,
      :pagination_token => :query,
      :expansions => :query,
      :"tweet.fields" => :query,
      :"user.fields" => :query,
      :"media.fields" => :query,
      :"place.fields" => :query,
      :"poll.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}/mentions")
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
  User post timeline by ID
  Returns the most recent Posts composed by a single user specified by the requested user ID.  For full details, see the [API reference](https://docs.x.com/x-api/posts/user-posts-timeline-by-user-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. Enter a single user ID.
  - `opts` (keyword): Optional parameters
    - `:max_results` (String.t): Specifies the number of Tweets to try and retrieve, up to a maximum of 100 per distinct request.   Retweets and replies are included in the count, even if `exclude=retweets,replies` are supplied.   By default, 10 results are returned if this parameter is not supplied. The minimum permitted value is 5. 
    - `:start_time` (String.t): YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339). The oldest or earliest UTC timestamp from which the Tweets will be provided. Only the 3200 most recent Tweets are available. Timestamp is in second granularity and is inclusive (i.e. 12:00:01 includes the first second of the minute). Minimum allowable time is 2010-11-06T00:00:00Z
    - `:end_time` (String.t): YYYY-MM-DDTHH:mm:ssZ (ISO 8601/RFC 3339). The oldest or earliest UTC timestamp from which the Tweets will be provided. Only the 3200 most recent Tweets are available. Timestamp is in second granularity and is inclusive (i.e. 12:00:01 includes the first second of the minute). Minimum allowable time is 2010-11-06T00:00:00Z
    - `:since_id` (String.t): Returns results with an ID greater than (that is, more recent than) the specified ID. Only the 3200 most recent Tweets are available. The result will exclude the `since_id`. If the limit of Tweets has occurred since the `since_id`, the `since_id` will be forced to the oldest ID available.
    - `:until_id` (String.t): Returns results with an ID less less than (that is, older than) the specified ID. Only the 3200 most recent Tweets are available. The result will exclude the `until_id`. If the limit of Tweets has occurred since the `until_id`, the `until_id` will be forced to the most recent ID available.
    - `:pagination_token` (String.t): This parameter is used to move forwards or backwards through pages of results, based on the value of the `next_token` or `previous_token` in the response. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id,edit_history_tweet_ids  Default values: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width  Default values: media_key,type
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id, options

  ### Returns

  - `{:ok, XApiEx.Model.PostsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec user_post_timeline_by_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PostsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def user_post_timeline_by_id(connection, id, opts \\ []) do
    optional_params = %{
      :max_results => :query,
      :start_time => :query,
      :end_time => :query,
      :since_id => :query,
      :until_id => :query,
      :pagination_token => :query,
      :expansions => :query,
      :"tweet.fields" => :query,
      :"user.fields" => :query,
      :"media.fields" => :query,
      :"place.fields" => :query,
      :"poll.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/users/#{id}/tweets")
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
end
