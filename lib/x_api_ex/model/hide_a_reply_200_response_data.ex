defmodule XApiEx.Model.HideAReply200ResponseData do
  @moduledoc """
  Inner data payload of the hide-a-reply response.

  Fields:
  - `hidden` - whether the reply is now hidden (`true` after a successful hide operation).
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
