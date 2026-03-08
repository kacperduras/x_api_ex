defmodule XApiEx.Model.UsersById400ResponseErrorsInnerParameters do
  @moduledoc """
  Parameter details for a validation error in the users-by-ID 400 response.

  Fields:
  - `ids` - list of user IDs that were invalid or could not be found.
  """

  @derive JSON.Encoder
  defstruct [
    :ids
  ]

  @type t :: %__MODULE__{
          :ids => [String.t()] | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
