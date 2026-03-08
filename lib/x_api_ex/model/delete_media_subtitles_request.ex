defmodule XApiEx.Model.DeleteMediaSubtitlesRequest do
  @moduledoc """
  Request body for deleting subtitles from an uploaded media object.

  Fields:
  - `id` - the media ID (media key) whose subtitles should be removed.
  - `language_code` - BCP-47 language code identifying the subtitle track to delete (e.g., `"en"`).
  - `media_category` - the media category (e.g., `"tweet_video"`).
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :language_code,
    :media_category
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :language_code => String.t() | nil,
          :media_category => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
