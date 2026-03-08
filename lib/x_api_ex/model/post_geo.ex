defmodule XApiEx.Model.Post.Geo do
  @moduledoc """
  Geographic location attached to a post.
  """

  @derive JSON.Encoder
  defstruct [
    :place_id
  ]

  @type t :: %__MODULE__{
          :place_id => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
