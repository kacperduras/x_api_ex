defmodule XApiEx.Model.Post do
  @moduledoc """
  A post (tweet) object with full field support.
  """

  @derive JSON.Encoder
  defstruct [
    :attachments,
    :author_id,
    :conversation_id,
    :created_at,
    :edit_history_tweet_ids,
    :entities,
    :geo,
    :id,
    :in_reply_to_user_id,
    :lang,
    :possibly_sensitive,
    :referenced_tweets,
    :source,
    :text,
    :username
  ]

  @type t :: %__MODULE__{
          :attachments => XApiEx.Model.Post.Attachments.t() | nil,
          :author_id => String.t() | nil,
          :conversation_id => String.t() | nil,
          :created_at => String.t() | nil,
          :edit_history_tweet_ids => [String.t()] | nil,
          :entities => XApiEx.Model.Post.Entities.t() | nil,
          :geo => XApiEx.Model.Post.Geo.t() | nil,
          :id => String.t() | nil,
          :in_reply_to_user_id => String.t() | nil,
          :lang => String.t() | nil,
          :possibly_sensitive => boolean() | nil,
          :referenced_tweets => [XApiEx.Model.Post.ReferencedPost.t()] | nil,
          :source => String.t() | nil,
          :text => String.t() | nil,
          :username => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:attachments, :struct, XApiEx.Model.Post.Attachments)
    |> Deserializer.deserialize(:entities, :struct, XApiEx.Model.Post.Entities)
    |> Deserializer.deserialize(:geo, :struct, XApiEx.Model.Post.Geo)
    |> Deserializer.deserialize(:referenced_tweets, :list, XApiEx.Model.Post.ReferencedPost)
  end
end
