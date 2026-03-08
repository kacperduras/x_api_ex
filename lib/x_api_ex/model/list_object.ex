defmodule XApiEx.Model.ListObject do
  @moduledoc """
  An X List object with id and name.
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :name
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :name => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
