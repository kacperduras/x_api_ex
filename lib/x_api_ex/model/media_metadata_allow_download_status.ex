defmodule XApiEx.Model.MediaMetadata.AllowDownloadStatus do
  @moduledoc """
  Indicates whether a media item is allowed to be downloaded by viewers.

  ## Fields

  - `allow_download` - when `true`, the media can be downloaded; `false` restricts downloading.
  """

  @derive JSON.Encoder
  defstruct [:allow_download]

  @type t :: %__MODULE__{:allow_download => boolean() | nil}

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
