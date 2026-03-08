defmodule XApiEx.Model.Post.Entities.Mention do
  @moduledoc """
  A mention entity within a post.
  """

  @derive JSON.Encoder
  defstruct [
    :end,
    :start,
    :username
  ]

  @type t :: %__MODULE__{
          :end => number() | nil,
          :start => number() | nil,
          :username => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
