defmodule XApiEx.Model.RemoveAMember200ResponseData do
  @moduledoc """
  Inner data payload of the remove-a-member response.

  Fields:
  - `is_member` - whether the user is still a member of the List (`false` after a successful removal).
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
