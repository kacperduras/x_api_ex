defmodule XApiEx.Model.FilterRulesMeta do
  @moduledoc """
  Metadata returned with filtered stream rules responses.
  """

  @derive JSON.Encoder
  defstruct [
    :sent,
    :summary
  ]

  @type t :: %__MODULE__{
          :sent => String.t() | nil,
          :summary => XApiEx.Model.FilterRulesMeta.Summary.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:summary, :struct, XApiEx.Model.FilterRulesMeta.Summary)
  end
end
