defmodule XApiEx.Model.MediaUploadStatus200Response do
  @moduledoc """
  Response returned when polling the processing status of an uploaded media object.

  Fields:
  - `data` - inner data struct with the media ID, key, size, and current processing info.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.MediaUploadStatus200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.MediaUploadStatus200ResponseData)
  end
end
