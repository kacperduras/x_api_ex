defmodule XApiEx.Model.UserSummary do
  @moduledoc """
  A user object with basic identification fields (id, name, username).
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :name,
    :username
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :name => String.t() | nil,
          :username => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
