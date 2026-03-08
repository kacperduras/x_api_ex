defmodule XApiEx.Model.FilterRulesResponse do
  @moduledoc """
  Response wrapper for filtered stream rules.
  """

  @derive JSON.Encoder
  defstruct [
    :data,
    :errors,
    :meta
  ]

  @type t :: %__MODULE__{
          :data => [XApiEx.Model.FilterRule.t()] | nil,
          :errors => [XApiEx.Model.ApiError.t()] | nil,
          :meta => XApiEx.Model.FilterRulesMeta.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :list, XApiEx.Model.FilterRule)
    |> Deserializer.deserialize(:errors, :list, XApiEx.Model.ApiError)
    |> Deserializer.deserialize(:meta, :struct, XApiEx.Model.FilterRulesMeta)
  end
end
