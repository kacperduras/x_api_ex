defmodule XApiEx.Model.UsersById400ResponseErrorsInner do
  @moduledoc """
  A single validation error entry within the 400 response for the users-by-ID lookup endpoint.

  Fields:
  - `message` - human-readable error message describing what went wrong.
  - `parameters` - structured parameter details indicating which IDs caused the error.
  """

  @derive JSON.Encoder
  defstruct [
    :message,
    :parameters
  ]

  @type t :: %__MODULE__{
          :message => String.t() | nil,
          :parameters => XApiEx.Model.UsersById400ResponseErrorsInnerParameters.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(
      :parameters,
      :struct,
      XApiEx.Model.UsersById400ResponseErrorsInnerParameters
    )
  end
end
