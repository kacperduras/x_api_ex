defmodule XApiEx.Model.RemoveAMember200Response do
  @moduledoc """
  Response returned when a user is successfully removed from an X List.

  Fields:
  - `data` - inner data struct confirming the updated membership state.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.RemoveAMember200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.RemoveAMember200ResponseData)
  end
end
