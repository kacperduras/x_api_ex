defmodule XApiEx.Model.ApiError do
  @moduledoc """
  Generic API error response used for 401 Unauthorized and 429 Too Many Requests responses.
  """

  @derive JSON.Encoder
  defstruct [
    :detail,
    :status,
    :title,
    :type
  ]

  @type t :: %__MODULE__{
          :detail => String.t() | nil,
          :status => number() | nil,
          :title => String.t() | nil,
          :type => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
