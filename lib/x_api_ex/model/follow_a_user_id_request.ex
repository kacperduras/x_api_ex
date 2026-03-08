defmodule XApiEx.Model.FollowAUserIdRequest do
  @moduledoc """
  Request body for following a user on X as the authenticated user.

  Fields:
  - `target_user_id` - the ID of the user to follow.
  """

  @derive JSON.Encoder
  defstruct [
    :target_user_id
  ]

  @type t :: %__MODULE__{
          :target_user_id => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
