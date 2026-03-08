defmodule XApiEx.Model.MediaMetadata.SharedInfo do
  @moduledoc """
  Indicates whether a media item has been shared from another post or user.

  ## Fields

  - `shared` - `true` if the media originated from a different post or was shared by another user.
  """

  @derive JSON.Encoder
  defstruct [:shared]

  @type t :: %__MODULE__{:shared => boolean() | nil}

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
