defmodule XApiEx.Model.HideAReply200Response do
  @moduledoc """
  Response returned when a reply is successfully hidden by the authenticated user.

  Fields:
  - `data` - inner data struct confirming the hidden state of the reply.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.HideAReply200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.HideAReply200ResponseData)
  end
end
