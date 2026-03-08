defmodule XApiEx.Api.ListPosts do
  @moduledoc """
  API calls for all endpoints tagged `ListPosts`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  List Posts lookup
  This endpoint returns all Posts from a List specified by the requested ID  For full details, see the [API reference](https://developer.twitter.com/en/docs/twitter-api/lists/list-posts/api-reference/get-lists-id-posts) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. The ID of the List you wish to recieve Post details on.
  - `opts` (keyword): Optional parameters
    - `:"tweet.fields"` (String.t): Comma-separated list of fields for the Tweet object. Allowed values: attachments,author_id,context_annotations,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang,non_public_metrics,organic_metrics,possibly_sensitive,promoted_metrics,public_metrics,referenced_tweets,reply_settings,source,text,withheld,edit_history_tweet_ids,edit_controls  Default values: id,text,edit_history_tweet_ids  OAuth1.0a User Context authorization required if any of the following fields are included in the request: non_public_metrics,organic_metrics,promoted_metrics 
    - `:expansions` (String.t): Expansions enable requests to expand an ID into a full object in the includes response object. Allowed value: author_id Default value: none
    - `:"user.fields"` (String.t): Comma-separated list of fields for the User object. Expansion required. Allowed values: created_at, description, entities, id, location, name, pinned_tweet_id, profile_image_url, protected, public_metrics, url, username, verified, withheld Default values: id,name,username
    - `:max_results` (String.t): The maximum number of results to be returned by a request. Allowed values: 1 through 100. Default value: 100
    - `:pagination_token` (String.t): This parameter is used to get the next 'page' of results. The value used with the parameter is pulled directly from the response provided by the API, and should not be modified.
    - `:""` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.PostsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec list_posts_lookup(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.PostsResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def list_posts_lookup(connection, id, opts \\ []) do
    optional_params = %{
      :"tweet.fields" => :query,
      :expansions => :query,
      :"user.fields" => :query,
      :max_results => :query,
      :pagination_token => :query,
      :"" => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/lists/#{id}/tweets")
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
