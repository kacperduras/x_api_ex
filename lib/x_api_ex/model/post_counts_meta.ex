defmodule XApiEx.Model.PostCountsMeta do
  @moduledoc """
  Metadata for post counts responses.
  """

  @derive JSON.Encoder
  defstruct [
    :total_tweet_count
  ]

  @type t :: %__MODULE__{
          :total_tweet_count => number() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
