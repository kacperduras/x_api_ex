defmodule XApiEx.Model.UnpinAList200ResponseData do
  @moduledoc """
  Inner data payload of the unpin-a-list response.

  Fields:
  - `pinned` - whether the List is still pinned by the authenticated user (`false` after a successful unpin).
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
