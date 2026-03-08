defmodule XApiEx.Model.UpdateAList200ResponseData do
  @moduledoc """
  Inner data payload of the update-a-list response.

  Fields:
  - `updated` - whether the List was successfully updated (`true` on success).
  """

  @derive JSON.Encoder
  defstruct [
    :updated
  ]

  @type t :: %__MODULE__{
          :updated => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
