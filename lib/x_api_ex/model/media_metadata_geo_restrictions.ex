defmodule XApiEx.Model.MediaMetadata.GeoRestrictions do
  @moduledoc """
  Geographic access restrictions for a media item.

  Country codes follow the ISO 3166-1 alpha-2 standard (e.g. `"US"`, `"DE"`).

  ## Fields

  - `blacklisted_country_codes` - countries where the media is blocked.
  - `whitelisted_country_codes` - countries where the media is exclusively allowed.
  """

  @derive JSON.Encoder
  defstruct [:blacklisted_country_codes, :whitelisted_country_codes]

  @type t :: %__MODULE__{
          :blacklisted_country_codes => [String.t()] | nil,
          :whitelisted_country_codes => [String.t()] | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value), do: value
end
