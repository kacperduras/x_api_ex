defmodule XApiEx.Model.SearchResponse do
  @moduledoc """
  Response wrapper for post search results (recent and full-archive).
  """

  @derive JSON.Encoder
  defstruct [
    :data,
    :includes,
    :meta
  ]

  @type t :: %__MODULE__{
          :data => [XApiEx.Model.Post.t()] | nil,
          :includes => XApiEx.Model.Expansions.t() | nil,
          :meta => XApiEx.Model.PaginationMeta.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :list, XApiEx.Model.Post)
    |> Deserializer.deserialize(:includes, :struct, XApiEx.Model.Expansions)
    |> Deserializer.deserialize(:meta, :struct, XApiEx.Model.PaginationMeta)
  end
end
