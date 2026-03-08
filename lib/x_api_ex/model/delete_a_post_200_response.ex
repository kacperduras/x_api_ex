defmodule XApiEx.Model.DeleteAPost200Response do
  @moduledoc """
  Response returned when a post is successfully deleted.

  Fields:
  - `data` - inner data struct confirming whether the deletion succeeded.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.DeleteAPost200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.DeleteAPost200ResponseData)
  end
end
