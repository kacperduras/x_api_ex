defmodule XApiEx.Api.SampledStream do
  @moduledoc """
  API calls for all endpoints tagged `SampledStream`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Stream (see description)
  Stream, in real-time, roughly a 1% sample of all public Posts.  Please note streaming responses are currently [not supported](https://github.com/postmanlabs/postman-app-support/issues/5040) in Postman. Use this to help form your request, then click on Code > cURL. Copy the cURL command and paste in terminal to view the response.  For full details, see the [API reference](https://docs.x.com/x-api/posts/sample-stream) for these endpoints.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,possibly_sensitive,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id,edit_history_tweet_ids  Default values: none
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,preview_image_url,public_metrics,type,url,width  Default values: media_key,type
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id,options
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:backfill_minutes` (String.t): Provide a whole number between 1 and 5.   This parameter enables the recovery of up to five minutes worth of data that may have been missed during a disconnection.   The backfilled Tweets will automatically flow through a reconnected stream, with older Tweets generally being delivered before any newly matching Tweets. This feature will deliver all Tweets that matched your rules and were published during the timeframe selected, meaning that if you were disconnected for 90 seconds, and you requested two minutes of backfill, you will receive 30 seconds worth of duplicate Tweets. Due to this, you should make sure your system is tolerant of duplicate  data.  *This feature is currently only available to the academic research product track*.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec stream_see_description1(Tesla.Env.client(), keyword()) ::
          {:ok, nil}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def stream_see_description1(connection, opts \\ []) do
    optional_params = %{
      :"tweet.fields" => :query,
      :expansions => :query,
      :"media.fields" => :query,
      :"poll.fields" => :query,
      :"place.fields" => :query,
      :"user.fields" => :query,
      :backfill_minutes => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/tweets/sample/stream")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
