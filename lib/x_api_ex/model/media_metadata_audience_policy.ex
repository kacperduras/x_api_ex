defmodule XApiEx.Model.MediaMetadata.AudiencePolicy do
  @moduledoc """
  Defines audience access policies for a media item.

  Controls which subscription tiers are permitted to view the media.

  ## Fields

  - `creator_subscriptions` - list of creator subscription identifiers that grant access.
  - `x_subscriptions` - list of X subscription identifiers that grant access.
  """

  @derive JSON.Encoder
  defstruct [:creator_subscriptions, :x_subscriptions]

  @type t :: %__MODULE__{
          :creator_subscriptions => [String.t()] | nil,
          :x_subscriptions => [String.t()] | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
