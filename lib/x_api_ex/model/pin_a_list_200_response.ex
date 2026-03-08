defmodule XApiEx.Model.PinAList200Response do
  @moduledoc """
  Response returned when the authenticated user successfully pins an X List.

  Fields:
  - `data` - inner data struct confirming the pinned state.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.PinAList200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.PinAList200ResponseData)
  end
end
