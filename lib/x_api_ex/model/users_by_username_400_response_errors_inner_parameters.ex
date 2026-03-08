defmodule XApiEx.Model.UsersByUsername400ResponseErrorsInnerParameters do
  @moduledoc """
  Parameter details for a validation error in the users-by-username 400 response.

  Fields:
  - `usernames` - list of usernames that were invalid or could not be found.
  """

  @derive JSON.Encoder
  defstruct [
    :usernames
  ]

  @type t :: %__MODULE__{
          :usernames => [String.t()] | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
