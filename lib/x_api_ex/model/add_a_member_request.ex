defmodule XApiEx.Model.AddAMemberRequest do
  @moduledoc """
  Request body for adding a user as a member to an X List.

  Fields:
  - `user_id` - the ID of the user to add to the List.
  """

  @derive JSON.Encoder
  defstruct [
    :user_id
  ]

  @type t :: %__MODULE__{
          :user_id => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
