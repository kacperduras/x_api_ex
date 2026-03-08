defmodule XApiEx.Model.FollowAUserId200ResponseData do
  @moduledoc """
  Inner data payload of the follow-a-user response.

  Fields:
  - `following` - whether the authenticated user is now following the target user.
  - `pending_follow` - whether the follow request is pending approval (for protected accounts).
  """

  @derive JSON.Encoder
  defstruct [
    :following,
    :pending_follow
  ]

  @type t :: %__MODULE__{
          :following => boolean() | nil,
          :pending_follow => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
