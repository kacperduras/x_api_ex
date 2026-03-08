defmodule XApiEx.Model.MediaMetadata.Sticker do
  @moduledoc """
  Represents a single sticker overlay applied to a media item.

  Position and scale are encoded as a 2D affine transform matrix (`transform_a` through `transform_ty`).

  ## Fields

  - `annotation_id` - unique identifier for this sticker annotation.
  - `aspect_ratio` - aspect ratio of the sticker image.
  - `group_annotation_id` - identifier grouping related sticker annotations.
  - `id` - sticker asset identifier.
  - `sticker_set_annotation_id` - identifier of the sticker set this sticker belongs to.
  - `transform_a`, `transform_b`, `transform_c`, `transform_d` - rotation/scale components of the affine matrix.
  - `transform_tx`, `transform_ty` - translation components of the affine matrix.
  """

  @derive JSON.Encoder
  defstruct [
    :annotation_id,
    :aspect_ratio,
    :group_annotation_id,
    :id,
    :sticker_set_annotation_id,
    :transform_a,
    :transform_b,
    :transform_c,
    :transform_d,
    :transform_tx,
    :transform_ty
  ]

  @type t :: %__MODULE__{
          :annotation_id => number() | nil,
          :aspect_ratio => number() | nil,
          :group_annotation_id => number() | nil,
          :id => term() | nil,
          :sticker_set_annotation_id => number() | nil,
          :transform_a => number() | nil,
          :transform_b => number() | nil,
          :transform_c => number() | nil,
          :transform_d => number() | nil,
          :transform_tx => number() | nil,
          :transform_ty => number() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
