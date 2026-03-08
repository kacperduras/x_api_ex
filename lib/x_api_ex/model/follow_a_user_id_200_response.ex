defmodule XApiEx.Model.FollowAUserId200Response do
  @moduledoc """
  Response returned when the authenticated user successfully follows another user.

  Fields:
  - `data` - inner data struct with the follow state and any pending status.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.FollowAUserId200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.FollowAUserId200ResponseData)
  end
end
