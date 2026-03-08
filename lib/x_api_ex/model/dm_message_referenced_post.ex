defmodule XApiEx.Model.DmMessage.ReferencedPost do
  @moduledoc """
  A referenced post within a DM.
  """

  @derive JSON.Encoder
  defstruct [
    :id
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
