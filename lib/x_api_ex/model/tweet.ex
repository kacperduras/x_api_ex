defmodule XApiEx.Model.Tweet do
  @moduledoc """
  A basic Tweet object with core identification fields.
  """

  @derive JSON.Encoder
  defstruct [
    :edit_history_tweet_ids,
    :id,
    :text
  ]

  @type t :: %__MODULE__{
          :edit_history_tweet_ids => [String.t()] | nil,
          :id => String.t() | nil,
          :text => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
