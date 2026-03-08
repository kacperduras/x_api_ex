defmodule XApiEx.Model.UploadMedia202Response do
  @moduledoc """
  Response (HTTP 202) returned when an asynchronous media upload has been accepted and is being processed.

  Fields:
  - `data` - inner data struct with the media ID, key, and expiry for the in-progress upload.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.UploadMedia202ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.UploadMedia202ResponseData)
  end
end
