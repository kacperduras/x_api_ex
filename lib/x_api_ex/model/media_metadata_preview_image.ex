defmodule XApiEx.Model.MediaMetadata.PreviewImage do
  @moduledoc """
  Preview image associated with a media item (e.g. video thumbnail).

  ## Fields

  - `media_key` - a `MediaMetadata.PreviewImageMediaKey` struct identifying the preview image asset.
  """

  @derive JSON.Encoder
  defstruct [:media_key]

  @type t :: %__MODULE__{
          :media_key => XApiEx.Model.MediaMetadata.PreviewImageMediaKey.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(
      :media_key,
      :struct,
      XApiEx.Model.MediaMetadata.PreviewImageMediaKey
    )
  end
end
