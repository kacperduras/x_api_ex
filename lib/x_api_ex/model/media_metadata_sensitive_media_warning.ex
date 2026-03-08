defmodule XApiEx.Model.MediaMetadata.SensitiveMediaWarning do
  @moduledoc """
  Sensitive content warning flags for a media item.

  When a flag is `true`, the platform may blur or hide the media behind a content warning.

  ## Fields

  - `adult_content` - media contains adult/explicit content.
  - `graphic_violence` - media contains graphic violent imagery.
  - `other` - media has been flagged for other sensitive content reasons.
  """

  @derive JSON.Encoder
  defstruct [:adult_content, :graphic_violence, :other]

  @type t :: %__MODULE__{
          :adult_content => boolean() | nil,
          :graphic_violence => boolean() | nil,
          :other => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
