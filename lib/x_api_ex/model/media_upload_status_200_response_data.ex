defmodule XApiEx.Model.MediaUploadStatus200ResponseData do
  @moduledoc """
  Inner data payload of the media-upload-status response.

  Fields:
  - `id` - numeric media ID assigned during upload.
  - `media_key` - composite media key used when attaching media to a post.
  - `processing_info` - current asynchronous processing state (state, progress, and check-back time).
  - `size` - size of the uploaded media in bytes.
  """

  @derive JSON.Encoder
  defstruct [
    :id,
    :media_key,
    :processing_info,
    :size
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :media_key => String.t() | nil,
          :processing_info =>
            XApiEx.Model.MediaUploadStatus200ResponseDataProcessingInfo.t() | nil,
          :size => number() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(
      :processing_info,
      :struct,
      XApiEx.Model.MediaUploadStatus200ResponseDataProcessingInfo
    )
  end
end
