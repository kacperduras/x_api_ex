defmodule XApiEx.Model.CreateAPostRequest do
  @moduledoc """
  Request body for creating a new post (tweet) on X.

  Fields:
  - `text` - the text content of the post to publish.
  """

  @derive JSON.Encoder
  defstruct [
    :text
  ]

  @type t :: %__MODULE__{
          :text => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
