defmodule XApiEx.Model.MediaUploadStatus200ResponseDataProcessingInfo do
  @moduledoc """
  Asynchronous processing information returned when polling media upload status.

  Fields:
  - `check_after_secs` - suggested number of seconds to wait before polling again.
  - `progress_percent` - processing completion percentage (0–100).
  - `state` - current processing state (e.g., `"pending"`, `"in_progress"`, `"succeeded"`, `"failed"`).
  """

  @derive JSON.Encoder
  defstruct [
    :check_after_secs,
    :progress_percent,
    :state
  ]

  @type t :: %__MODULE__{
          :check_after_secs => number() | nil,
          :progress_percent => number() | nil,
          :state => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
