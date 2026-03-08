defmodule XApiEx.Api.ManageDirectMessages do
  @moduledoc """
  API calls for all endpoints tagged `ManageDirectMessages`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Add DM to conversation
  Creates a new message for a DM Conversation specified by DM Conversation ID.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/direct-messages/send-a-new-message-to-a-dm-conversation).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `dm_conversation_id` (String.t): The conversation ID that this message will be added to. Supports both one-to-one and group conversations. 
  - `opts` (keyword): Optional parameters
    - `:body` (AddDmToConversationRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.DmResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec add_dm_to_conversation(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.DmResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def add_dm_to_conversation(connection, dm_conversation_id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/dm_conversations/#{dm_conversation_id}/messages")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {201, XApiEx.Model.DmResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  New 1-1 DM message
  Creates a new message for a DM Conversation with a participant user by ID.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/direct-messages/send-a-new-message-to-a-user).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `participant_id` (String.t): The User ID of who is receiving this one-to-one Direct Message
  - `opts` (keyword): Optional parameters
    - `:body` (New11DmMessageRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.DmResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec new11_dm_message(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.DmResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def new11_dm_message(connection, participant_id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/dm_conversations/with/#{participant_id}/messages")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {201, XApiEx.Model.DmResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  New group DM and conversation
  Creates a new DM Conversation.  For full details, see the [API reference for this endpoint](https://docs.x.com/x-api/direct-messages/create-a-new-dm-conversation).  To get started, sign up for the [X API](https://developer.twitter.com/en/portal/dashboard).

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (NewGroupDmAndConversationRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.DmResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec new_group_dm_and_conversation(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.DmResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def new_group_dm_and_conversation(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/dm_conversations/")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {201, XApiEx.Model.DmResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
