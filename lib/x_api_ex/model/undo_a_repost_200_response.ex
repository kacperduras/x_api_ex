defmodule XApiEx.Model.UndoARepost200Response do
  @moduledoc """
  Response returned when the authenticated user successfully undoes a repost (un-retweets).

  Fields:
  - `data` - inner data struct confirming the updated repost state.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.UndoARepost200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.UndoARepost200ResponseData)
  end
end
