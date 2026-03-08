defmodule XApiEx.Model.NewGroupDmAndConversationRequest do
  @moduledoc """
  Request body for creating a new group DM conversation and optionally sending an initial message.

  Fields:
  - `conversation_type` - the type of conversation to create (e.g., `"Group"`).
  - `message` - optional initial message to send when creating the conversation.
  - `participant_ids` - list of user IDs to add as participants in the group DM.
  """

  @derive JSON.Encoder
  defstruct [
    :conversation_type,
    :message,
    :participant_ids
  ]

  @type t :: %__MODULE__{
          :conversation_type => String.t() | nil,
          :message => XApiEx.Model.NewGroupDmAndConversationRequest.Message.t() | nil,
          :participant_ids => [String.t()] | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(
      :message,
      :struct,
      XApiEx.Model.NewGroupDmAndConversationRequest.Message
    )
  end
end
