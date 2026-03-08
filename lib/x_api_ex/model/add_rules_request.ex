defmodule XApiEx.Model.AddRulesRequest do
  @moduledoc """
  Request body for adding one or more filtered stream rules.

  Fields:
  - `add` - list of `AddRulesRequest.Rule` structs, each defining a filter rule to create.
  """

  @derive JSON.Encoder
  defstruct [
    :add
  ]

  @type t :: %__MODULE__{
          :add => [XApiEx.Model.AddRulesRequest.Rule.t()] | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:add, :list, XApiEx.Model.AddRulesRequest.Rule)
  end
end
