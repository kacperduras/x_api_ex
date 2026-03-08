defmodule XApiEx.Model.CreateABatchComplianceJobRequest do
  @moduledoc """
  Request body for creating a new batch compliance job.

  Fields:
  - `type` - the type of compliance job to create (`"tweets"` or `"users"`).
  """

  @derive JSON.Encoder
  defstruct [
    :type
  ]

  @type t :: %__MODULE__{
          :type => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
