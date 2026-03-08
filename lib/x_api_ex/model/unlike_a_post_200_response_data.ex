defmodule XApiEx.Model.UnlikeAPost200ResponseData do
  @moduledoc """
  Inner data payload of the unlike-a-post response.

  Fields:
  - `liked` - whether the post is still liked by the authenticated user (`false` after a successful unlike).
  """

  @derive JSON.Encoder
  defstruct [
    :liked
  ]

  @type t :: %__MODULE__{
          :liked => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
