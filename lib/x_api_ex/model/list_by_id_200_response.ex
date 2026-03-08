defmodule XApiEx.Model.ListById200Response do
  @moduledoc """
  Response returned when looking up an X List by its ID.

  Fields:
  - `data` - inner data struct with the List's ID and name.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.ListById200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.ListById200ResponseData)
  end
end
