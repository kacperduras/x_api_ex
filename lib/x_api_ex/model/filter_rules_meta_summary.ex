defmodule XApiEx.Model.FilterRulesMeta.Summary do
  @moduledoc """
  Summary of rule operations.
  """

  @derive JSON.Encoder
  defstruct [
    :created,
    :deleted,
    :invalid,
    :not_created,
    :not_deleted,
    :valid
  ]

  @type t :: %__MODULE__{
          :created => number() | nil,
          :deleted => number() | nil,
          :invalid => number() | nil,
          :not_created => number() | nil,
          :not_deleted => number() | nil,
          :valid => number() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
