defmodule XApiEx.Model.MediaMetadata.FoundMediaOrigin do
  @moduledoc """
  Records the original source of a media item when it was ingested from an external provider.

  ## Fields

  - `id` - identifier of the media item at the origin provider.
  - `provider` - name or identifier of the origin provider (e.g. `"giphy"`).
  """

  @derive JSON.Encoder
  defstruct [:id, :provider]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :provider => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
