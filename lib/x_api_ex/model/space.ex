defmodule XApiEx.Model.Space do
  @moduledoc """
  A Space object with basic identification fields.
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :state
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :state => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
