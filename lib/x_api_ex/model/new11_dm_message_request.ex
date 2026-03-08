defmodule XApiEx.Model.New11DmMessageRequest do
  @moduledoc """
  Request body for sending a new Direct Message to an existing DM conversation.

  Fields:
  - `text` - the text content of the message to send.
  """

  @derive JSON.Encoder
  defstruct [
    :text
  ]

  @type t :: %__MODULE__{
          :text => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
