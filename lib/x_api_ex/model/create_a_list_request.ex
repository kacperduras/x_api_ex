defmodule XApiEx.Model.CreateAListRequest do
  @moduledoc """
  Request body for creating a new X List.

  Fields:
  - `description` - optional description of the List.
  - `name` - display name for the new List (required).
  - `private` - whether the List should be private (`true`) or public (`false`).
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
