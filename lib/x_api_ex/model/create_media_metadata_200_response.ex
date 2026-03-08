defmodule XApiEx.Model.CreateMediaMetadata200Response do
  @moduledoc """
  Response returned when media metadata is successfully created or updated.

  Fields:
  - `data` - inner data struct with the media ID and associated metadata.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.CreateMediaMetadata200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.CreateMediaMetadata200ResponseData)
  end
end
