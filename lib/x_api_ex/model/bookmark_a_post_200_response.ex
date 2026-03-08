defmodule XApiEx.Model.BookmarkAPost200Response do
  @moduledoc """
  Response returned when a post is successfully bookmarked by the authenticated user.

  Fields:
  - `data` - inner data struct confirming the bookmark action.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.BookmarkAPost200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.BookmarkAPost200ResponseData)
  end
end
