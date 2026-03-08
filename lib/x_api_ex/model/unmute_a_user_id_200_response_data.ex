defmodule XApiEx.Model.UnmuteAUserId200ResponseData do
  @moduledoc """
  Inner data payload of the unmute-a-user response.

  Fields:
  - `muting` - whether the target user is still muted by the authenticated user (`false` after a successful unmute).
  """

  @derive JSON.Encoder
  defstruct [
    :muting
  ]

  @type t :: %__MODULE__{
          :muting => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
