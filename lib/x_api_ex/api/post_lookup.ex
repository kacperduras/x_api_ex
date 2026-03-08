defmodule XApiEx.Api.PostLookup do
  @moduledoc """
  API calls for all endpoints tagged `PostLookup`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Multiple Posts
  This endpoint returns details about up to 100 Posts specified by the requested IDs.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/posts/lookup/api-reference/get-posts) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:ids` (String.t): Required. Enter up to 100 comma-separated Tweet IDs.
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics 
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id  Default values: none
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width  Default values: media_key,type  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id, options
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username

  ### Returns

  - `{:ok, XApiEx.Model.PostsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec multiple_posts(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, nil}
          | {:ok, XApiEx.Model.MultiplePosts400Response.t()}
          | {:ok, XApiEx.Model.PostsResponse.t()}
          | {:error, Tesla.Env.t()}
  def multiple_posts(connection, opts \\ []) do
    optional_params = %{
      :ids => :query,
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
      |> url("/2/tweets")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.PostsResponse},
      {400, XApiEx.Model.MultiplePosts400Response},
      {401, XApiEx.Model.ApiError},
      {429, false}
    ])
  end

  @doc """
  Single Post
  This endpoint returns details about the Post specified by the requested ID.  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/posts/lookup/api-reference/get-posts-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the Post you wish to delete
  - `opts` (keyword): Optional parameters
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics 
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id,edit_history_tweet_ids  Default values: none
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width  Default values: media_key,type  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id, options
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username

  ### Returns

  - `{:ok, XApiEx.Model.PostResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec single_post(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, nil}
          | {:ok, XApiEx.Model.PostResponse.t()}
          | {:error, Tesla.Env.t()}
  def single_post(connection, id, opts \\ []) do
    optional_params = %{
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
      |> url("/2/tweets/#{id}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.PostResponse},
      {401, XApiEx.Model.ApiError},
      {429, false}
    ])
  end
end
