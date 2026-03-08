defmodule XApiEx.Model.RepostAPost200ResponseData do
  @moduledoc """
  Inner data payload of the repost-a-post response.

  Fields:
  - `rest_id` - ID of the repost (retweet) object created.
  - `retweeted` - whether the post is now reposted by the authenticated user (`true` after a successful repost).
  """

  @derive JSON.Encoder
  defstruct [
    :rest_id,
    :retweeted
  ]

  @type t :: %__MODULE__{
          :rest_id => String.t() | nil,
          :retweeted => boolean() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
