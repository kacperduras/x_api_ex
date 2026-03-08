defmodule XApiEx.Model.UnmuteAUserId200Response do
  @moduledoc """
  Response returned when the authenticated user successfully unmutes another user.

  Fields:
  - `data` - inner data struct confirming the updated muting state.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.UnmuteAUserId200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.UnmuteAUserId200ResponseData)
  end
end
