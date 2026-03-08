defmodule XApiEx.Model.Place.Geo.Geometry do
  @moduledoc """
  GeoJSON geometry for a place.
  """

  @derive JSON.Encoder
  defstruct [
    :coordinates,
    :type
  ]

  @type t :: %__MODULE__{
          :coordinates => [number()] | nil,
          :type => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
