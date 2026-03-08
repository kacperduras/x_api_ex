defmodule XApiEx.Model.CreateMediaSubtitlesRequest.Subtitle do
  @moduledoc """
  A subtitle to attach to a media object.
  """

  @derive JSON.Encoder
  defstruct [
    :display_name,
    :id,
    :language_code
  ]

  @type t :: %__MODULE__{
          :display_name => String.t() | nil,
          :id => String.t() | nil,
          :language_code => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
