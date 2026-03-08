defmodule XApiEx.Model.Place.Geo do
  @moduledoc """
  Geo information for a place.
  """

  @derive JSON.Encoder
  defstruct [
    :bbox,
    :geometry,
    :properties,
    :type
  ]

  @type t :: %__MODULE__{
          :bbox => [number()] | nil,
          :geometry => XApiEx.Model.Place.Geo.Geometry.t() | nil,
          :properties => map() | nil,
          :type => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:geometry, :struct, XApiEx.Model.Place.Geo.Geometry)
  end
end
