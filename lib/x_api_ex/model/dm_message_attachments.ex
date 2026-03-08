defmodule XApiEx.Model.DmMessage.Attachments do
  @moduledoc """
  Attachments in a DM event.
  """

  @derive JSON.Encoder
  defstruct [
    :card_ids,
    :media_keys
  ]

  @type t :: %__MODULE__{
          :card_ids => [String.t()] | nil,
          :media_keys => [String.t()] | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
