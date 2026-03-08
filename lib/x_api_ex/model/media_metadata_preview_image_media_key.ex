defmodule XApiEx.Model.MediaMetadata.PreviewImageMediaKey do
  @moduledoc """
  Identifies the preview image asset for a media item via its media key and category.

  ## Fields

  - `media` - numeric media identifier.
  - `media_category` - category string for the preview image (e.g. `"tweet_image"`).
  """

  @derive JSON.Encoder
  defstruct [:media, :media_category]

  @type t :: %__MODULE__{
          :media => number() | nil,
          :media_category => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
