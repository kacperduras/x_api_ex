defmodule XApiEx.Model.SpaceTopic do
  @moduledoc """
  A topic associated with a Space.
  """

  @derive JSON.Encoder
  defstruct [
    :description,
    :id,
    :name
  ]

  @type t :: %__MODULE__{
          :description => String.t() | nil,
          :id => String.t() | nil,
          :name => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
