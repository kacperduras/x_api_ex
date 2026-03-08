defmodule XApiEx.Model.HideAReplyRequest do
  @moduledoc """
  Request body for hiding or unhiding a reply on X.

  Fields:
  - `hidden` - set to `true` to hide the reply, or `false` to make it visible again.
  """

  @derive JSON.Encoder
  defstruct [
    :hidden
  ]

  @type t :: %__MODULE__{
          :hidden => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
