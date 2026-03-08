defmodule XApiEx.Model.MediaMetadata.AltText do
  @moduledoc """
  Alternative text for a media item, used for accessibility purposes.

  ## Fields

  - `text` - human-readable description of the media content.
  """

  @derive JSON.Encoder
  defstruct [:text]

  @type t :: %__MODULE__{:text => String.t() | nil}

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
