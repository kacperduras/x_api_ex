defmodule XApiEx.Model.New11DmMessage201Response do
  @moduledoc """
  Response (HTTP 201) returned when a new Direct Message is successfully sent to an existing DM conversation.

  Fields:
  - `data` - inner data struct with the conversation and event IDs of the new message.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.New11DmMessage201ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.New11DmMessage201ResponseData)
  end
end
