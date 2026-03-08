defmodule XApiEx.Model.UpdateAList200Response do
  @moduledoc """
  Response returned when an X List is successfully updated.

  Fields:
  - `data` - inner data struct confirming whether the update was applied.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.UpdateAList200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.UpdateAList200ResponseData)
  end
end
