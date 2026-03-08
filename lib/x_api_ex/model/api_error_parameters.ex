defmodule XApiEx.Model.ApiError.Parameters do
  @moduledoc """
  Invalid parameters details within an API error.
  """

  @derive JSON.Encoder
  defstruct [
    :delete,
    :ids,
    :usernames
  ]

  @type t :: %__MODULE__{
          :delete => [any()] | nil,
          :ids => [String.t()] | nil,
          :usernames => [String.t()] | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
