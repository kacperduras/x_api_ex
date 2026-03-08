defmodule XApiEx.Api.FilteredStream do
  @moduledoc """
  API calls for all endpoints tagged `FilteredStream`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Add Rules
  Create filter rules. To create one or more rules, submit an add payload as an array of rules and operators.  For full details, see the [API reference](https://docs.x.com/x-api/posts/adddelete-rules) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (AddRulesRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.FilterRulesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec add_rules(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.FilterRulesResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.RetrieveRules403Response.t()}
          | {:ok, XApiEx.Model.FilterRulesResponse.t()}
          | {:ok, XApiEx.Model.AddRules400Response.t()}
          | {:error, Tesla.Env.t()}
  def add_rules(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/tweets/search/stream/rules")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.FilterRulesResponse},
      {201, XApiEx.Model.FilterRulesResponse},
      {400, XApiEx.Model.AddRules400Response},
      {401, XApiEx.Model.ApiError},
      {403, XApiEx.Model.RetrieveRules403Response},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Retrieve Rules
  Returns a list of filter rules currently active on the streaming endpoint.  For full details, see the [API reference](https://docs.x.com/x-api/posts/rules-lookup) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.FilterRulesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec retrieve_rules(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.FilterRulesResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.RetrieveRules403Response.t()}
          | {:error, Tesla.Env.t()}
  def retrieve_rules(connection, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/2/tweets/search/stream/rules")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.FilterRulesResponse},
      {401, XApiEx.Model.ApiError},
      {403, XApiEx.Model.RetrieveRules403Response},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Stream (see description)
  Streams Posts in real-time based on a specific set of filter rules.  Please note streaming responses are currently [not supported](https://github.com/postmanlabs/postman-app-support/issues/5040) in Postman. Use this to help form your request, then click on Code > cURL. Copy the cURL command and paste in terminal to view the response.  For full details, see the [API reference](https://docs.x.com/x-api/posts/filtered-stream) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,possibly_sensitive,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed values: attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id  Default values: none
    - `:"media.fields"` (String.t): Comma-separated list of fields for the media object. Expansion required.  Allowed values: duration_ms,height,media_key,preview_image_url,public_metrics,type,url,width  Default values: media_key,type
    - `:"poll.fields"` (String.t): Comma-separated list of fields for the poll object. Expansion required.  Allowed values: duration_minutes,end_datetime,id,options,voting_status  Default values: id,options
    - `:"place.fields"` (String.t): Comma-separated list of fields for the place object. Expansion required.  Allowed values: contained_within,country,country_code,full_name,geo,id,name,place_type  Default values: id,full_name
    - `:"user.fields"` (String.t): Comma-separated list of fields for the user object. Expansion required.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:backfill_minutes` (String.t): Provide a whole number between 1 and 5.   This parameter enables the recovery of up to five minutes worth of data that may have been missed during a disconnection.   The backfilled Tweets will automatically flow through a reconnected stream, with older Tweets generally being delivered before any newly matching Tweets. This feature will deliver all Tweets that matched your rules and were published during the timeframe selected, meaning that if you were disconnected for 90 seconds, and you requested two minutes of backfill, you will receive 30 seconds worth of duplicate Tweets. Due to this, you should make sure your system is tolerant of duplicate  data.  *This feature is currently only available to the academic research product track*.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec stream_see_description(Tesla.Env.client(), keyword()) ::
          {:ok, nil}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.StreamSeeDescription429Response.t()}
          | {:error, Tesla.Env.t()}
  def stream_see_description(connection, opts \\ []) do
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
      |> url("/2/tweets/search/stream")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.StreamSeeDescription429Response}
    ])
  end
end
