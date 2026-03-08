defmodule XApiEx.Model.MediaMetadata.StickerInfo do
  @moduledoc """
  Container for all sticker overlays associated with a media item.

  ## Fields

  - `stickers` - list of `MediaMetadata.Sticker` structs describing each sticker overlay.
  """

  @derive JSON.Encoder
  defstruct [:stickers]

  @type t :: %__MODULE__{
          :stickers => [XApiEx.Model.MediaMetadata.Sticker.t()] | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:stickers, :list, XApiEx.Model.MediaMetadata.Sticker)
  end
end
