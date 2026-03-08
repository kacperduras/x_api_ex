defmodule XApiEx.Model.ListsResponse do
  @moduledoc """
  Response wrapper for a list of X Lists.
  """

  @derive JSON.Encoder
  defstruct [
    :data,
    :meta
  ]

  @type t :: %__MODULE__{
          :data => [XApiEx.Model.ListObject.t()] | nil,
          :meta => XApiEx.Model.PaginationMeta.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :list, XApiEx.Model.ListObject)
    |> Deserializer.deserialize(:meta, :struct, XApiEx.Model.PaginationMeta)
  end
end
