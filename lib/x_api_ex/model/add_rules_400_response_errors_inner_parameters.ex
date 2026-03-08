defmodule XApiEx.Model.AddRules400ResponseErrorsInnerParameters do
  @moduledoc """
  Parameter details for a validation error in the add-rules 400 response, identifying which rule entries were invalid.

  Fields:
  - `delete` - list of raw parameter values that were rejected (typically indices or IDs of the offending rules).
  """

  @derive JSON.Encoder
  defstruct [
    :delete
  ]

  @type t :: %__MODULE__{
          :delete => [any()] | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
