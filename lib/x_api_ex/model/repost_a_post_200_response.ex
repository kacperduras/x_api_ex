defmodule XApiEx.Model.RepostAPost200Response do
  @moduledoc """
  Response returned when the authenticated user successfully reposts (retweets) a post.

  Fields:
  - `data` - inner data struct confirming the repost state.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.RepostAPost200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.RepostAPost200ResponseData)
  end
end
