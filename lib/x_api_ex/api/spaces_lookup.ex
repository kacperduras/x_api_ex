defmodule XApiEx.Api.SpacesLookup do
  @moduledoc """
  API calls for all endpoints tagged `SpacesLookup`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Lookup Spaces created by one or more users
  This endpoint returns information about a user. Specify user by username.  For full details, see the [API reference](https://docs.x.com/x-api/spaces/space-lookup-by-their-creators) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:user_ids` (String.t): Required. A comma-separated list of user IDs. You can specify up 100 IDs in a single request.
    - `:"space.fields"` (String.t): Comma-separated list of fields from the Space object you want to return from your request.  Available fields: host_ids,created_at,creator_id,id,lang,invited_user_ids, participant_count,speaker_ids,started_at,state,title,updated_at, scheduled_start,is_ticketed,ended_at,topic_ids  Default fields: id,state
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Available values: invited_user_ids,speaker_ids,creator_id,host_ids
    - `:"user.fields"` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Available values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name.username
    - `:"topic.fields"` (String.t): Comma-separated list of fields from the Space Topics object you want to return from your request.  Available values: id,name,description

  ### Returns

  - `{:ok, XApiEx.Model.SpacesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec lookup_spaces_created_by_one_or_more_users(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.SpacesResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def lookup_spaces_created_by_one_or_more_users(connection, opts \\ []) do
    optional_params = %{
      :user_ids => :query,
      :"space.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query,
      :"topic.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/spaces/by/creator_ids")
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

  @doc """
  Spaces lookup by list of IDs
  This endpoint returns information about one or more Spaces with the specified comma-separated list of IDs. You can request up to 100 Spaces in a single request  For full details, see the [API reference](https://docs.x.com/x-api/spaces/space-lookup-by-space-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:ids` (String.t): Required. A comma separated list of IDs of the Spaces to lookup. You can specify up to 100 IDs.
    - `:"space.fields"` (String.t): Comma-separated list of fields from the Space object you want to return from your request.  Available fields: host_ids,created_at,creator_id,id,lang,invited_user_ids, participant_count,speaker_ids,started_at,state,title,updated_at, scheduled_start,is_ticketed,ended_at,topic_ids  Default fields: id,state
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Available values: invited_user_ids,speaker_ids,creator_id,host_ids
    - `:"user.fields"` (String.t): Comma-separated list of fields from the Space object you want to return from your request.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:"topic.fields"` (String.t): Comma-separated list of fields from the Space Topics object you want to return from your request.  Available values: id,name,description

  ### Returns

  - `{:ok, XApiEx.Model.SpacesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec spaces_lookup_by_list_of_ids(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.SpacesResponse.t()}
          | {:error, Tesla.Env.t()}
  def spaces_lookup_by_list_of_ids(connection, opts \\ []) do
    optional_params = %{
      :ids => :query,
      :"space.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query,
      :"topic.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/spaces")
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

  @doc """
  Spaces lookup by single ID
  This endpoint returns information about a single Space with the specified ID.  For full details, see the [API reference](https://docs.x.com/x-api/spaces/space-lookup-by-space-id) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): The ID of the Spaces to lookup.
  - `opts` (keyword): Optional parameters
    - `:"space.fields"` (String.t): Comma-separated list of fields from the Space object you want to return from your request.  Available fields: host_ids,created_at,creator_id,id,lang,invited_user_ids, participant_count,speaker_ids,started_at,state,title,updated_at, scheduled_start,is_ticketed,ended_at,topic_ids  Default fields: id,state
    - `:expansions` (String.t): Comma-separated list of fields to expand. Expansions enable requests to expand an ID into a full object in the includes response object.  Available values: invited_user_ids,speaker_ids,creator_id,host_ids
    - `:"user.fields"` (String.t): Comma-separated list of fields from the Space object you want to return from your request.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:"topic.fields"` (String.t): Comma-separated list of fields from the Space Topics object you want to return from your request.  Available values: id,name,description

  ### Returns

  - `{:ok, XApiEx.Model.SpaceResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec spaces_lookup_by_single_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.SpaceResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def spaces_lookup_by_single_id(connection, id, opts \\ []) do
    optional_params = %{
      :"space.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query,
      :"topic.fields" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/spaces/#{id}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.SpaceResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Users who bought a ticket to a Space
  Returns a list of users who are blocked by the specified user ID.  For full details, see the [API reference](https://docs.x.com/x-api/spaces/retrieve-the-list-of-users-who-purchased-a-ticket-to-the-given-space) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The user ID whose blocked users you would like to retrieve. The user’s ID must correspond to the user ID of the authenticating user, meaning that you must pass the Access Tokens associated with the user ID when authenticating your request.
  - `opts` (keyword): Optional parameters
    - `:"user.fields"` (String.t): Comma-separated fields for the user object. Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: pinned_tweet_id Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required. Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,source,text,withheld Default values: id,text OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:"user.fields"` (String.t): Comma-separated fields for the user object.  Allowed values: created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld  Default values: id,name,username
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object.  Allowed value: pinned_tweet_id  Default value: none
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Expansion required.  Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld  Default values: id,text  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics

  ### Returns

  - `{:ok, XApiEx.Model.UsersResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec users_who_bought_a_ticket_to_a_space(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.UsersResponse.t()}
          | {:error, Tesla.Env.t()}
  def users_who_bought_a_ticket_to_a_space(connection, id, opts \\ []) do
    optional_params = %{
      :"user.fields" => :query,
      :expansions => :query,
      :"tweet.fields" => :query,
      :pagination_token => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/spaces/#{id}/buyers")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.UsersResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
