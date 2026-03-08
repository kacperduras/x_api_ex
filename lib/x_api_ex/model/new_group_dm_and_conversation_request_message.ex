defmodule XApiEx.Model.NewGroupDmAndConversationRequest.Message do
  @moduledoc """
  The message content for a new group DM conversation.
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
