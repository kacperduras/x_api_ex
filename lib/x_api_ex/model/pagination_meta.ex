defmodule XApiEx.Model.PaginationMeta do
  @moduledoc """
  Pagination metadata returned alongside paginated API responses.
  """

  @derive JSON.Encoder
  defstruct [
    :newest_id,
    :next_token,
    :oldest_id,
    :previous_token,
    :result_count
  ]

  @type t :: %__MODULE__{
          :newest_id => String.t() | nil,
          :next_token => String.t() | nil,
          :oldest_id => String.t() | nil,
          :previous_token => String.t() | nil,
          :result_count => number() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
