defmodule XApiEx.Model.CreateMediaSubtitles200ResponseData do
  @moduledoc """
  Inner data payload of the create-media-subtitles response.

  Fields:
  - `associated_subtitles` - list of subtitle entries now attached to the media.
  - `id` - unique media ID (media key) of the media object.
  - `media_category` - category of the media (e.g., `"tweet_video"`).
  """

  @derive JSON.Encoder
  defstruct [
    :associated_subtitles,
    :id,
    :media_category
  ]

  @type t :: %__MODULE__{
          :associated_subtitles => [XApiEx.Model.CreateMediaSubtitlesRequest.Subtitle.t()] | nil,
          :id => String.t() | nil,
          :media_category => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(
      :associated_subtitles,
      :list,
      XApiEx.Model.CreateMediaSubtitlesRequest.Subtitle
    )
  end
end
