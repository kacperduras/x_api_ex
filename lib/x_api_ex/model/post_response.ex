defmodule XApiEx.Model.PostResponse do
  @moduledoc """
  Response wrapper for a single post.
  """

  @derive JSON.Encoder
  defstruct [
    :data,
    :errors,
    :includes
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.Post.t() | nil,
          :errors => [XApiEx.Model.ApiError.t()] | nil,
          :includes => XApiEx.Model.Expansions.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.Post)
    |> Deserializer.deserialize(:errors, :list, XApiEx.Model.ApiError)
    |> Deserializer.deserialize(:includes, :struct, XApiEx.Model.Expansions)
  end
end
