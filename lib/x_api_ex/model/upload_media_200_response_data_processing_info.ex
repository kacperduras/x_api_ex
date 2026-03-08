defmodule XApiEx.Model.UploadMedia200ResponseDataProcessingInfo do
  @moduledoc """
  Asynchronous processing information included in the upload-media 200 response when server-side processing is required.

  Fields:
  - `check_after_secs` - suggested number of seconds to wait before polling the status endpoint again.
  - `state` - current processing state (e.g., `"pending"`, `"in_progress"`, `"succeeded"`, `"failed"`).
  """

  @derive JSON.Encoder
  defstruct [
    :check_after_secs,
    :state
  ]

  @type t :: %__MODULE__{
          :check_after_secs => number() | nil,
          :state => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
