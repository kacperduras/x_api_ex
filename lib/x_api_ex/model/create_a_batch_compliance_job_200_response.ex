defmodule XApiEx.Model.CreateABatchComplianceJob200Response do
  @moduledoc """
  Response returned when a batch compliance job is successfully created.

  Fields:
  - `data` - inner data struct with the details of the newly created compliance job.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.CreateABatchComplianceJob200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(
      :data,
      :struct,
      XApiEx.Model.CreateABatchComplianceJob200ResponseData
    )
  end
end
