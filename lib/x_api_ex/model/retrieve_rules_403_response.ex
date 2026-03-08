defmodule XApiEx.Model.RetrieveRules403Response do
  @moduledoc """
  Error response (HTTP 403) returned when the caller lacks access to the filtered stream rules endpoint,
  typically because the required access level or product subscription is missing.

  Fields:
  - `client_id` - the OAuth client ID associated with the request.
  - `detail` - human-readable explanation of why access was denied.
  - `reason` - machine-readable reason code for the denial.
  - `registration_url` - URL the developer can visit to apply for the required access.
  - `required_enrollment` - the product enrollment or access tier required.
  - `title` - short error title.
  - `type` - URI identifying the error type.
  """

  @derive JSON.Encoder
  defstruct [
    :client_id,
    :detail,
    :reason,
    :registration_url,
    :required_enrollment,
    :title,
    :type
  ]

  @type t :: %__MODULE__{
          :client_id => String.t() | nil,
          :detail => String.t() | nil,
          :reason => String.t() | nil,
          :registration_url => String.t() | nil,
          :required_enrollment => String.t() | nil,
          :title => String.t() | nil,
          :type => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
