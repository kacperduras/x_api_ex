defmodule XApiEx.Api.HideReplies do
  @moduledoc """
  API calls for all endpoints tagged `HideReplies`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Hide a reply
  Provides the ability to hide a reply to a Post.  For full details, see the [API reference](https://docs.x.com/x-api/posts/hide-replies) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): Required. Enter a single Post ID.
  - `opts` (keyword): Optional parameters
    - `:body` (HideAReplyRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.HideAReply200Response.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec hide_a_reply(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.HideAReply200Response.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def hide_a_reply(connection, id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:put)
      |> url("/2/tweets/#{id}/hidden")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.HideAReply200Response},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
