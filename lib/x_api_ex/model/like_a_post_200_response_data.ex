defmodule XApiEx.Model.LikeAPost200ResponseData do
  @moduledoc """
  Inner data payload of the like-a-post response.

  Fields:
  - `liked` - whether the post is now liked by the authenticated user (`true` after a successful like).
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
