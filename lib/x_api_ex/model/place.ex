defmodule XApiEx.Model.Place do
  @moduledoc """
  A geographic place object.
  """

  @derive JSON.Encoder
  defstruct [
    :contained_within,
    :country,
    :country_code,
    :full_name,
    :geo,
    :id,
    :name,
    :place_type
  ]

  @type t :: %__MODULE__{
          :contained_within => [String.t()] | nil,
          :country => String.t() | nil,
          :country_code => String.t() | nil,
          :full_name => String.t() | nil,
          :geo => XApiEx.Model.Place.Geo.t() | nil,
          :id => String.t() | nil,
          :name => String.t() | nil,
          :place_type => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:geo, :struct, XApiEx.Model.Place.Geo)
  end
end
