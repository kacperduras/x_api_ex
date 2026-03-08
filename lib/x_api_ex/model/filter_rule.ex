defmodule XApiEx.Model.FilterRule do
  @moduledoc """
  A filtered stream rule.
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :tag,
    :value
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :tag => String.t() | nil,
          :value => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
