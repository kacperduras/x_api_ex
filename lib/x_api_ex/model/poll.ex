defmodule XApiEx.Model.Poll do
  @moduledoc """
  A poll attached to a Tweet.
  """

  @derive JSON.Encoder
  defstruct [
    :duration_minutes,
    :end_datetime,
    :id,
    :options,
    :voting_status
  ]

  @type t :: %__MODULE__{
          :duration_minutes => number() | nil,
          :end_datetime => String.t() | nil,
          :id => String.t() | nil,
          :options => [XApiEx.Model.PollOption.t()] | nil,
          :voting_status => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:options, :list, XApiEx.Model.PollOption)
  end
end
