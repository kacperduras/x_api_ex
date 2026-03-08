defmodule XApiEx.Model.MediaMetadata.ContentExpiration do
  @moduledoc """
  Specifies when a media item expires and becomes unavailable.

  ## Fields

  - `timestamp_sec` - Unix timestamp (seconds since epoch) after which the media is no longer accessible.
  """

  @derive JSON.Encoder
  defstruct [:timestamp_sec]

  @type t :: %__MODULE__{:timestamp_sec => number() | nil}

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
