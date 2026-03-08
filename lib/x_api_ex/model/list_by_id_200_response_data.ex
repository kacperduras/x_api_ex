defmodule XApiEx.Model.ListById200ResponseData do
  @moduledoc """
  Inner data payload of the list-by-id response, identifying the requested X List.

  Fields:
  - `id` - unique identifier of the List.
  - `name` - display name of the List.
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :name
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :name => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
