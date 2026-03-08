defmodule XApiEx.Model.MediaMetadata.ManagementInfo do
  @moduledoc """
  Indicates whether a media item is under managed/enterprise content management.

  ## Fields

  - `managed` - `true` if the media is managed by an enterprise content policy.
  """

  @derive JSON.Encoder
  defstruct [:managed]

  @type t :: %__MODULE__{:managed => boolean() | nil}

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
