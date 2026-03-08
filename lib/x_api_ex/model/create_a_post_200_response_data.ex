defmodule XApiEx.Model.CreateAPost200ResponseData do
  @moduledoc """
  Inner data payload of the create-a-post response, describing the newly published post.

  Fields:
  - `edit_history_tweet_ids` - list of tweet IDs representing the full edit history of this post.
  - `id` - unique identifier of the newly created post.
  - `text` - text content of the post.
  """

  @derive JSON.Encoder
  defstruct [
    :edit_history_tweet_ids,
    :id,
    :text
  ]

  @type t :: %__MODULE__{
          :edit_history_tweet_ids => [String.t()] | nil,
          :id => String.t() | nil,
          :text => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
