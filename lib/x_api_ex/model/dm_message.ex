defmodule XApiEx.Model.DmMessage do
  @moduledoc """
  A direct message event object.
  """

  @derive JSON.Encoder
  defstruct [
    :attachments,
    :cashtags,
    :created_at,
    :dm_conversation_id,
    :event_type,
    :hashtags,
    :id,
    :mentions,
    :participant_ids,
    :referenced_tweets,
    :sender_id,
    :text,
    :urls
  ]

  @type t :: %__MODULE__{
          :attachments => XApiEx.Model.DmMessage.Attachments.t() | nil,
          :cashtags => [XApiEx.Model.DmMessage.Cashtag.t()] | nil,
          :created_at => String.t() | nil,
          :dm_conversation_id => String.t() | nil,
          :event_type => String.t() | nil,
          :hashtags => [XApiEx.Model.DmMessage.Hashtag.t()] | nil,
          :id => String.t() | nil,
          :mentions => [XApiEx.Model.DmMessage.Mention.t()] | nil,
          :participant_ids => [String.t()] | nil,
          :referenced_tweets => [XApiEx.Model.DmMessage.ReferencedPost.t()] | nil,
          :sender_id => String.t() | nil,
          :text => String.t() | nil,
          :urls => [XApiEx.Model.DmMessage.Url.t()] | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:attachments, :struct, XApiEx.Model.DmMessage.Attachments)
    |> Deserializer.deserialize(:cashtags, :list, XApiEx.Model.DmMessage.Cashtag)
    |> Deserializer.deserialize(:hashtags, :list, XApiEx.Model.DmMessage.Hashtag)
    |> Deserializer.deserialize(:mentions, :list, XApiEx.Model.DmMessage.Mention)
    |> Deserializer.deserialize(:referenced_tweets, :list, XApiEx.Model.DmMessage.ReferencedPost)
    |> Deserializer.deserialize(:urls, :list, XApiEx.Model.DmMessage.Url)
  end
end
