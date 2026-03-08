defmodule XApiEx.Model.BookmarkAPost200ResponseData do
  @moduledoc """
  Inner data payload of the bookmark-a-post response.

  Fields:
  - `bookmarked` - whether the post is now bookmarked (`true` after a successful bookmark).
  """

  @derive JSON.Encoder
  defstruct [
    :bookmarked
  ]

  @type t :: %__MODULE__{
          :bookmarked => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
