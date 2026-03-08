defmodule XApiEx.Model.New11DmMessage201ResponseData do
  @moduledoc """
  Inner data payload of the new-DM-message 201 response, identifying the sent message.

  Fields:
  - `dm_conversation_id` - ID of the DM conversation the message was sent to.
  - `dm_event_id` - unique ID of the newly created DM event (message).
  """

  @derive JSON.Encoder
  defstruct [
    :dm_conversation_id,
    :dm_event_id
  ]

  @type t :: %__MODULE__{
          :dm_conversation_id => String.t() | nil,
          :dm_event_id => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
