defmodule XApiEx.Model.CreateAList201ResponseData do
  @moduledoc """
  Inner data payload of the create-a-list 201 response, identifying the newly created List.

  Fields:
  - `id` - unique identifier of the created List.
  - `name` - display name of the created List.
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
