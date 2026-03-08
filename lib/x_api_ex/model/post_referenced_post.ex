defmodule XApiEx.Model.Post.ReferencedPost do
  @moduledoc """
  A referenced post (e.g. replied-to or retweeted post).
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :type
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :type => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
