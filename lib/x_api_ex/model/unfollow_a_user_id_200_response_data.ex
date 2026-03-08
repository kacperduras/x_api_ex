defmodule XApiEx.Model.UnfollowAUserId200ResponseData do
  @moduledoc """
  Inner data payload of the unfollow-a-user response.

  Fields:
  - `following` - whether the authenticated user is still following the target user (`false` after a successful unfollow).
  """

  @derive JSON.Encoder
  defstruct [
    :following
  ]

  @type t :: %__MODULE__{
          :following => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
