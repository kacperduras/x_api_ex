defmodule XApiEx.Model.AddAMember200ResponseData do
  @moduledoc """
  Inner data payload of the add-a-member response, confirming the membership state.

  Fields:
  - `is_member` - whether the user is now a member of the List (`true` after a successful add).
  """

  @derive JSON.Encoder
  defstruct [
    :is_member
  ]

  @type t :: %__MODULE__{
          :is_member => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
