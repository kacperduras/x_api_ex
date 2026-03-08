defmodule XApiEx.Model.CreateAList201Response do
  @moduledoc """
  Response returned (HTTP 201) when a new X List is successfully created.

  Fields:
  - `data` - inner data struct containing the new List's ID and name.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.CreateAList201ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.CreateAList201ResponseData)
  end
end
