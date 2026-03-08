defmodule XApiEx.Model.CreateABatchComplianceJob200ResponseData do
  @moduledoc """
  Data payload describing a newly created batch compliance job.

  Fields:
  - `created_at` - ISO 8601 timestamp when the job was created.
  - `download_expires_at` - ISO 8601 timestamp after which the download URL expires.
  - `download_url` - pre-signed URL to download the compliance results once the job completes.
  - `id` - unique identifier of the compliance job.
  - `resumable` - whether the upload supports resumable chunked uploads.
  - `status` - current status of the job (e.g., `"created"`, `"in_progress"`, `"complete"`).
  - `type` - type of compliance job (`"tweets"` or `"users"`).
  - `upload_expires_at` - ISO 8601 timestamp after which the upload URL expires.
  - `upload_url` - pre-signed URL used to upload the list of IDs for compliance checking.
  """

  @derive JSON.Encoder
  defstruct [
    :created_at,
    :download_expires_at,
    :download_url,
    :id,
    :resumable,
    :status,
    :type,
    :upload_expires_at,
    :upload_url
  ]

  @type t :: %__MODULE__{
          :created_at => String.t() | nil,
          :download_expires_at => String.t() | nil,
          :download_url => String.t() | nil,
          :id => String.t() | nil,
          :resumable => boolean() | nil,
          :status => String.t() | nil,
          :type => String.t() | nil,
          :upload_expires_at => String.t() | nil,
          :upload_url => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
