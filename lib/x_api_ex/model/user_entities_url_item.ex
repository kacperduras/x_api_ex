defmodule XApiEx.Model.User.Entities.Url.Item do
  @moduledoc """
  An individual URL within a user's profile URL entities.
  """

  @derive JSON.Encoder
  defstruct [
    :display_url,
    :end,
    :expanded_url,
    :start,
    :url
  ]

  @type t :: %__MODULE__{
          :display_url => String.t() | nil,
          :end => number() | nil,
          :expanded_url => String.t() | nil,
          :start => number() | nil,
          :url => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
