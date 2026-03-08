defmodule XApiEx.Model.User.Entities.Description do
  @moduledoc """
  Entities within a user's description.
  """

  @derive JSON.Encoder
  defstruct [
    :hashtags
  ]

  @type t :: %__MODULE__{
          :hashtags => [XApiEx.Model.User.Entities.Hashtag.t()] | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:hashtags, :list, XApiEx.Model.User.Entities.Hashtag)
  end
end
