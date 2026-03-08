defmodule XApiEx.Model.UploadMedia200ResponseData do
  @moduledoc """
  Inner data payload of the upload-media 200 response, describing the fully uploaded media object.

  Fields:
  - `expires_after_secs` - number of seconds until the uploaded media expires and can no longer be attached to a post.
  - `id` - numeric media ID assigned by the API.
  - `media_key` - composite media key used when attaching this media to a post.
  - `processing_info` - asynchronous processing state if the media requires server-side processing.
  - `size` - size of the uploaded file in bytes.
  """

  @derive JSON.Encoder
  defstruct [
    :expires_after_secs,
    :id,
    :media_key,
    :processing_info,
    :size
  ]

  @type t :: %__MODULE__{
          :expires_after_secs => number() | nil,
          :id => String.t() | nil,
          :media_key => String.t() | nil,
          :processing_info => XApiEx.Model.UploadMedia200ResponseDataProcessingInfo.t() | nil,
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
      XApiEx.Model.UploadMedia200ResponseDataProcessingInfo
    )
  end
end
