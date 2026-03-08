defmodule XApiEx.Model.Post.Entities.UrlImage do
  @moduledoc """
  An image preview within a URL entity.
  """

  @derive JSON.Encoder
  defstruct [
    :height,
    :url,
    :width
  ]

  @type t :: %__MODULE__{
          :height => number() | nil,
          :url => String.t() | nil,
          :width => number() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
