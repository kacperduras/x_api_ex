defmodule XApiEx.Model.DmMessage.Cashtag do
  @moduledoc """
  A cashtag entity within a DM.
  """

  @derive JSON.Encoder
  defstruct [
    :end,
    :start,
    :tag
  ]

  @type t :: %__MODULE__{
          :end => number() | nil,
          :start => number() | nil,
          :tag => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
