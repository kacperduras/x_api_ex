defmodule XApiEx.Model.DeleteAPost200ResponseData do
  @moduledoc """
  Inner data payload of the delete-a-post response.

  Fields:
  - `deleted` - whether the post was successfully deleted (`true` on success).
  """

  @derive JSON.Encoder
  defstruct [
    :deleted
  ]

  @type t :: %__MODULE__{
          :deleted => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
