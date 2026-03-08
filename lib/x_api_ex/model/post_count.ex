defmodule XApiEx.Model.PostCount do
  @moduledoc """
  Post count data point for a time interval.
  """

  @derive JSON.Encoder
  defstruct [
    :end,
    :start,
    :tweet_count
  ]

  @type t :: %__MODULE__{
          :end => String.t() | nil,
          :start => String.t() | nil,
          :tweet_count => number() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
