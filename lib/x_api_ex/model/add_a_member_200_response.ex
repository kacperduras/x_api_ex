defmodule XApiEx.Model.AddAMember200Response do
  @moduledoc """
  Response returned when a user is successfully added as a member of an X List.

  Fields:
  - `data` - inner data struct containing the membership status.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.AddAMember200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.AddAMember200ResponseData)
  end
end
