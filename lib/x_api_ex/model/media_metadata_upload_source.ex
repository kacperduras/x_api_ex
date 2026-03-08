defmodule XApiEx.Model.MediaMetadata.UploadSource do
  @moduledoc """
  Identifies the source from which a media item was uploaded.

  ## Fields

  - `upload_source` - string identifier for the upload origin (e.g. `"twitter_web_client"`, `"mobile_sdk"`).
  """

  @derive JSON.Encoder
  defstruct [:upload_source]

  @type t :: %__MODULE__{:upload_source => String.t() | nil}

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
