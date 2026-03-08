defmodule XApiEx.Model.User.Entities do
  @moduledoc """
  Entity objects for a user profile.
  """

  @derive JSON.Encoder
  defstruct [
    :description,
    :url
  ]

  @type t :: %__MODULE__{
          :description => XApiEx.Model.User.Entities.Description.t() | nil,
          :url => XApiEx.Model.User.Entities.Url.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:description, :struct, XApiEx.Model.User.Entities.Description)
    |> Deserializer.deserialize(:url, :struct, XApiEx.Model.User.Entities.Url)
  end
end
