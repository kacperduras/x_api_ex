defmodule XApiEx.Model.UsersById400Response do
  @moduledoc """
  Error response (HTTP 400) returned when a lookup of users by ID fails due to a bad request.

  Fields:
  - `detail` - human-readable description of the error.
  - `errors` - list of individual validation errors.
  - `title` - short error title.
  - `type` - URI identifying the error type.
  """

  @derive JSON.Encoder
  defstruct [
    :detail,
    :errors,
    :title,
    :type
  ]

  @type t :: %__MODULE__{
          :detail => String.t() | nil,
          :errors => [XApiEx.Model.UsersById400ResponseErrorsInner.t()] | nil,
          :title => String.t() | nil,
          :type => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:errors, :list, XApiEx.Model.UsersById400ResponseErrorsInner)
  end
end
