defmodule XApiEx.Model.User.Entities.Url do
  @moduledoc """
  URL entities within a user profile.
  """

  @derive JSON.Encoder
  defstruct [
    :urls
  ]

  @type t :: %__MODULE__{
          :urls => [XApiEx.Model.User.Entities.Url.Item.t()] | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:urls, :list, XApiEx.Model.User.Entities.Url.Item)
  end
end
