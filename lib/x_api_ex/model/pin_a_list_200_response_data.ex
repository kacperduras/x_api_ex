defmodule XApiEx.Model.PinAList200ResponseData do
  @moduledoc """
  Inner data payload of the pin-a-list response.

  Fields:
  - `pinned` - whether the List is now pinned by the authenticated user (`true` after a successful pin).
  """

  @derive JSON.Encoder
  defstruct [
    :pinned
  ]

  @type t :: %__MODULE__{
          :pinned => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
