defmodule XApiEx.Model.AddRulesRequest.Rule do
  @moduledoc """
  A single filter rule to add.
  """

  @derive JSON.Encoder
  defstruct [
    :value
  ]

  @type t :: %__MODULE__{
          :value => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
