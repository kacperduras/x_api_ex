defmodule XApiEx.Model.StreamSeeDescription429Response do
  @moduledoc """
  Error response (HTTP 429) returned when a streaming connection is refused due to rate limiting
  or too many concurrent connections.

  Fields:
  - `connection_issue` - describes the specific connection problem (e.g., `"TooManyConnections"`, `"SlowConsumer"`).
  - `detail` - human-readable explanation of the rate limit or connection issue.
  - `title` - short error title.
  - `type` - URI identifying the error type.
  """

  @derive JSON.Encoder
  defstruct [
    :connection_issue,
    :detail,
    :title,
    :type
  ]

  @type t :: %__MODULE__{
          :connection_issue => String.t() | nil,
          :detail => String.t() | nil,
          :title => String.t() | nil,
          :type => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
