defmodule XApiEx.Api.DirectMessagesLookup do
  @moduledoc """
  API calls for all endpoints tagged `DirectMessagesLookup`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  DM events by 1-1 conversation
  Returns DM Events for a DM Conversation by participant ID.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/direct-messages/get-dm-events-for-a-dm-conversation).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `participant_id` (String.t): The User ID of who this one-to-one Direct Message is with.
  - `opts` (keyword): Optional parameters
    - `:event_types` (String.t): Allowed values: MessageCreate,ParticipantsJoin,ParticipantsLeave  Comma-separated list of fields (with no spaces).   All event types are returned by default. 
    - `:max_results` (String.t): The maximum number of search results to be returned by a request. A number between 1 and the system limit (currently 100). By default, a request response will return 100 results.
    - `:pagination_token` (String.t): This parameter is used to get the next or previous 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:"media.fields"` (String.t): Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width  Default values: media_key,type  Requires the attachments.media_keys expansion.   Comma-separated list of fields (with no spaces). 
    - `:"tweet.fields"` (String.t): Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld  Default fields: id, text, and edit_history_tweet_ids.  Requires the referenced_tweets.id expansion.  Comma-separated list of fields (with no spaces). 
    - `:"user.fields"` (String.t): Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld  Default values: id,name,username  Requires the participants_ids and/or sender_id expansions.  Comma-separated list of fields (with no spaces). 
    - `:expansions` (String.t): Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld  Default values: id,name,username  Requires the participants_ids and/or sender_id expansions.  Comma-separated list of fields (with no spaces). 
    - `:"dm_event.fields"` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec dm_events_by11_conversation(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def dm_events_by11_conversation(connection, participant_id, opts \\ []) do
    optional_params = %{
      :event_types => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"media.fields" => :query,
      :"tweet.fields" => :query,
      :"user.fields" => :query,
      :expansions => :query,
      :"dm_event.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/dm_conversations/with/#{participant_id}/dm_events")
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

  @doc """
  DM events by User
  Returns all of the DM Events for an authenticated user.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/direct-messahttps://docs.x.com/x-api/direct-messages/get-recent-dm-eventsges/get-dm-events-for-a-dm-conversation-1).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"dm_event.fields"` (String.t): Allowed values: id,text,event_type,dm_conversation_id,created_at,sender_id,attachments,participant_ids,referenced_tweets  id, text, and event_type are returned by default.  Comma-separated list of fields (with no spaces). 
    - `:event_types` (String.t): Allowed values: MessageCreate,ParticipantsJoin,ParticipantsLeave  Comma-separated list of fields (with no spaces).   All event types are returned by default. 
    - `:max_results` (String.t): The maximum number of search results to be returned by a request. A number between 1 and the system limit (currently 100). By default, a request response will return 100 results.
    - `:pagination_token` (String.t): This parameter is used to get the next or previous 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:"media.fields"` (String.t): Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width  Default values: media_key,type  Requires the attachments.media_keys expansion.   Comma-separated list of fields (with no spaces). 
    - `:"tweet.fields"` (String.t): Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld  Default fields: id, text, and edit_history_tweet_ids.  Requires the referenced_tweets.id expansion.  Comma-separated list of fields (with no spaces). 
    - `:"user.fields"` (String.t): Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld  Default values: id,name,username  Requires the participants_ids and/or sender_id expansions.  Comma-separated list of fields (with no spaces). 
    - `:expansions` (String.t): Allowed values: sender_id,referenced_tweets.id,attachments.media_keys,participant_ids Comma-separated list of fields (with no spaces). 

  ### Returns

  - `{:ok, XApiEx.Model.DmsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec dm_events_by_user(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.DmsResponse.t()}
          | {:error, Tesla.Env.t()}
  def dm_events_by_user(connection, opts \\ []) do
    optional_params = %{
      :"dm_event.fields" => :query,
      :event_types => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"media.fields" => :query,
      :"tweet.fields" => :query,
      :"user.fields" => :query,
      :expansions => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/dm_events")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.DmsResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Get DMs by conversation
  Returns DM Events for a DM Conversation by conversation ID.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/direct-messages/get-dm-events-for-a-dm-conversation-1).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `dm_conversation_id` (String.t): Events are retrieved for the conversation associated with this ID. Supports both one-to-one and group conversations. 
  - `opts` (keyword): Optional parameters
    - `:"dm_event.fields"` (String.t): Allowed values: id,text,event_type,dm_conversation_id,created_at,sender_id,attachments,participant_ids,referenced_tweets id, text, and event_type are returned by default. Comma-separated list of fields (with no spaces). 
    - `:event_types` (String.t): Allowed values: MessageCreate,ParticipantsJoin,ParticipantsLeave Comma-separated list of fields (with no spaces).  All event types are returned by default. 
    - `:max_results` (String.t): The maximum number of search results to be returned by a request. A number between 1 and the system limit (currently 100). By default, a request response will return 100 results.
    - `:pagination_token` (String.t): This parameter is used to get the next or previous 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:"media.fields"` (String.t): Allowed values: duration_ms,height,media_key,non_public_metrics,organic_metrics,preview_image_url,promoted_metrics,public_metrics,type,url,width Default values: media_key,type Requires the attachments.media_keys expansion.  Comma-separated list of fields (with no spaces). 
    - `:"tweet.fields"` (String.t): Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld Default fields: id, text, and edit_history_tweet_ids. Requires the referenced_tweets.id expansion. Comma-separated list of fields (with no spaces). 
    - `:"user.fields"` (String.t): Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld Default values: id,name,username Requires the participants_ids and/or sender_id expansions. Comma-separated list of fields (with no spaces). 
    - `:expansions` (String.t): Allowed values: sender_id,referenced_tweets.id,attachments.media_keys,participant_ids Comma-separated list of fields (with no spaces). 

  ### Returns

  - `{:ok, XApiEx.Model.DmsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_dms_by_conversation(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.DmsResponse.t()}
          | {:error, Tesla.Env.t()}
  def get_dms_by_conversation(connection, dm_conversation_id, opts \\ []) do
    optional_params = %{
      :"dm_event.fields" => :query,
      :event_types => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"media.fields" => :query,
      :"tweet.fields" => :query,
      :"user.fields" => :query,
      :expansions => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/dm_conversations/#{dm_conversation_id}/dm_events")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.DmsResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
