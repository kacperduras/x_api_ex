defmodule XApiEx.Model.CreateMediaSubtitlesRequest do
  @moduledoc """
  Request body for adding subtitles to an uploaded media object.

  Fields:
  - `id` - the media ID (media key) to attach subtitles to.
  - `media_category` - the media category (e.g., `"tweet_video"`).
  - `subtitles` - a `CreateMediaSubtitlesRequest.Subtitle` struct describing the subtitle to add.
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :media_category,
    :subtitles
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :media_category => String.t() | nil,
          :subtitles => XApiEx.Model.CreateMediaSubtitlesRequest.Subtitle.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(
      :subtitles,
      :struct,
      XApiEx.Model.CreateMediaSubtitlesRequest.Subtitle
    )
  end
end
