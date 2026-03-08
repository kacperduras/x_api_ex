defmodule XApiEx.Model.UndoARepost200ResponseData do
  @moduledoc """
  Inner data payload of the undo-a-repost response.

  Fields:
  - `retweeted` - whether the post is still reposted by the authenticated user (`false` after a successful undo).
  """

  @derive JSON.Encoder
  defstruct [
    :retweeted
  ]

  @type t :: %__MODULE__{
          :retweeted => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
