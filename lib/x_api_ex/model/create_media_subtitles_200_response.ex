defmodule XApiEx.Model.CreateMediaSubtitles200Response do
  @moduledoc """
  Response returned when subtitles are successfully created for a media object.

  Fields:
  - `data` - inner data struct with the media ID and the list of associated subtitles.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.CreateMediaSubtitles200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.CreateMediaSubtitles200ResponseData)
  end
end
