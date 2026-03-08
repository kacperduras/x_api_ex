defmodule XApiEx.Model.UnlikeAPost200Response do
  @moduledoc """
  Response returned when the authenticated user successfully unlikes a post.

  Fields:
  - `data` - inner data struct confirming the updated like state.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.UnlikeAPost200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.UnlikeAPost200ResponseData)
  end
end
