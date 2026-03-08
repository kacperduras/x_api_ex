defmodule XApiEx.Model.Media.PublicMetrics do
  @moduledoc """
  Public metrics for a media object.
  """

  @derive JSON.Encoder
  defstruct [
    :view_count
  ]

  @type t :: %__MODULE__{
          :view_count => number() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
