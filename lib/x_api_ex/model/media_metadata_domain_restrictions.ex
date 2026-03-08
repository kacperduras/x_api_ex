defmodule XApiEx.Model.MediaMetadata.DomainRestrictions do
  @moduledoc """
  Restricts media playback or embedding to a set of allowed domains.

  ## Fields

  - `whitelist` - list of domain strings permitted to embed or play the media.
  """

  @derive JSON.Encoder
  defstruct [:whitelist]

  @type t :: %__MODULE__{:whitelist => [String.t()] | nil}

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
