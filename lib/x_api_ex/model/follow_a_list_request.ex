defmodule XApiEx.Model.FollowAListRequest do
  @moduledoc """
  Request body for following an X List as the authenticated user.

  Fields:
  - `list_id` - the ID of the List to follow.
  """

  @derive JSON.Encoder
  defstruct [
    :list_id
  ]

  @type t :: %__MODULE__{
          :list_id => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
