defmodule XApiEx.Model.UploadMedia200Response do
  @moduledoc """
  Response (HTTP 200) returned when a synchronous media upload completes immediately.

  Fields:
  - `data` - inner data struct with the media ID, key, size, expiry, and any processing info.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.UploadMedia200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.UploadMedia200ResponseData)
  end
end
