defmodule XApiEx.Model.UpdateAListRequest do
  @moduledoc """
  Request body for updating an existing X List's metadata.

  Fields:
  - `description` - new description to set for the List (optional).
  - `name` - new display name for the List (optional).
  - `private` - set to `true` to make the List private, `false` for public (optional).
  """

  @derive JSON.Encoder
  defstruct [
    :description,
    :name,
    :private
  ]

  @type t :: %__MODULE__{
          :description => String.t() | nil,
          :name => String.t() | nil,
          :private => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
