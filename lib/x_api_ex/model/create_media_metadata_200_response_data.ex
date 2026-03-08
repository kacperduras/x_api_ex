defmodule XApiEx.Model.CreateMediaMetadata200ResponseData do
  @moduledoc """
  Inner data payload of the create-media-metadata response, containing the media record and its metadata.

  Fields:
  - `associated_metadata` - the full `MediaMetadata` struct attached to this media object.
  - `id` - unique media ID (media key) of the updated media.
  """

  @derive JSON.Encoder
  defstruct [
    :associated_metadata,
    :id
  ]

  @type t :: %__MODULE__{
          :associated_metadata => XApiEx.Model.MediaMetadata.t() | nil,
          :id => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:associated_metadata, :struct, XApiEx.Model.MediaMetadata)
  end
end
