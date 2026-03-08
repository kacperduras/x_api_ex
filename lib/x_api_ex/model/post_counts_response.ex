defmodule XApiEx.Model.PostCountsResponse do
  @moduledoc """
  Response wrapper for post count timeseries data.
  """

  @derive JSON.Encoder
  defstruct [
    :data,
    :meta
  ]

  @type t :: %__MODULE__{
          :data => [XApiEx.Model.PostCount.t()] | nil,
          :meta => XApiEx.Model.PostCountsMeta.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :list, XApiEx.Model.PostCount)
    |> Deserializer.deserialize(:meta, :struct, XApiEx.Model.PostCountsMeta)
  end
end
