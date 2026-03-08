defmodule XApiEx.Model.FollowAList200ResponseData do
  @moduledoc """
  Inner data payload of the follow-a-list response.

  Fields:
  - `following` - whether the authenticated user is now following the List (`true` after a successful follow).
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
