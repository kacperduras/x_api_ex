defmodule XApiEx.Model.CreateAPost200Response do
  @moduledoc """
  Response returned when a new post (tweet) is successfully created.

  Fields:
  - `data` - inner data struct with the created post's identifiers and text.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.CreateAPost200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.CreateAPost200ResponseData)
  end
end
