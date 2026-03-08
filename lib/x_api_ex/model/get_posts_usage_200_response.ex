defmodule XApiEx.Model.GetPostsUsage200Response do
  @moduledoc """
  Response returned for the posts usage endpoint, showing the API usage cap and consumption for a project.

  Fields:
  - `data` - inner data struct with the project-level usage details.
  """

  @derive JSON.Encoder
  defstruct [
    :data
  ]

  @type t :: %__MODULE__{
          :data => XApiEx.Model.GetPostsUsage200ResponseData.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:data, :struct, XApiEx.Model.GetPostsUsage200ResponseData)
  end
end
