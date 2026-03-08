defmodule XApiEx.Model.MuteAUserId200ResponseData do
  @moduledoc """
  Inner data payload of the mute-a-user response.

  Fields:
  - `muting` - whether the target user is now muted by the authenticated user (`true` after a successful mute).
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
