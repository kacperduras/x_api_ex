defmodule XApiEx.Model.Post.Entities do
  @moduledoc """
  Entities extracted from a post (hashtags, mentions, URLs).
  """

  @derive JSON.Encoder
  defstruct [
    :hashtags,
    :mentions,
    :urls
  ]

  @type t :: %__MODULE__{
          :hashtags => [XApiEx.Model.Post.Entities.Hashtag.t()] | nil,
          :mentions => [XApiEx.Model.Post.Entities.Mention.t()] | nil,
          :urls => [XApiEx.Model.Post.Entities.Url.t()] | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:hashtags, :list, XApiEx.Model.Post.Entities.Hashtag)
    |> Deserializer.deserialize(:mentions, :list, XApiEx.Model.Post.Entities.Mention)
    |> Deserializer.deserialize(:urls, :list, XApiEx.Model.Post.Entities.Url)
  end
end
