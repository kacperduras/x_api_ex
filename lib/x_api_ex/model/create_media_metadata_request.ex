defmodule XApiEx.Model.CreateMediaMetadataRequest do
  @moduledoc """
  Request body for creating or updating metadata associated with an uploaded media object.

  Fields:
  - `id` - the media ID (media key) to attach metadata to.
  - `metadata` - the `MediaMetadata` struct containing the metadata fields to set.
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :metadata
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :metadata => XApiEx.Model.MediaMetadata.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:metadata, :struct, XApiEx.Model.MediaMetadata)
  end
end
