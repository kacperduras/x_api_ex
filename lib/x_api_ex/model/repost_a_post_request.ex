defmodule XApiEx.Model.RepostAPostRequest do
  @moduledoc """
  Request body for reposting (retweeting) a post on behalf of the authenticated user.

  Fields:
  - `tweet_id` - the ID of the post to repost.
  """

  @derive JSON.Encoder
  defstruct [
    :tweet_id
  ]

  @type t :: %__MODULE__{
          :tweet_id => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
