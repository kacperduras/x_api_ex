defmodule XApiEx.Model.UploadMedia202ResponseData do
  @moduledoc """
  Inner data payload of the upload-media 202 response for an asynchronous upload.

  Fields:
  - `expires_after_secs` - number of seconds until the upload session expires.
  - `id` - numeric media ID assigned by the API.
  - `media_key` - composite media key used when attaching this media to a post once processing completes.
  """

  @derive JSON.Encoder
  defstruct [
    :expires_after_secs,
    :id,
    :media_key
  ]

  @type t :: %__MODULE__{
          :expires_after_secs => number() | nil,
          :id => String.t() | nil,
          :media_key => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
