defmodule XApiEx.Model.PollOption do
  @moduledoc """
  A single option within a Poll.
  """

  @derive JSON.Encoder
  defstruct [
    :label,
    :position,
    :votes
  ]

  @type t :: %__MODULE__{
          :label => String.t() | nil,
          :position => number() | nil,
          :votes => number() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
