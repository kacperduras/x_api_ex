defmodule XApiEx.Model.FollowAList200Response do
  @moduledoc """
  Response returned when the authenticated user successfully follows an X List.

  Fields:
  - `data` - inner data struct confirming the following state.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.FollowAList200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.FollowAList200ResponseData)
  end
end
