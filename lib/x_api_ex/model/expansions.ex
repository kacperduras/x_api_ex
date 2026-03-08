defmodule XApiEx.Model.Expansions do
  @moduledoc """
  Expanded objects returned alongside API responses via the expansions parameter.
  """

  @derive JSON.Encoder
  defstruct [
    :media,
    :places,
    :polls,
    :topics,
    :tweets,
    :users
  ]

  @type t :: %__MODULE__{
          :media => [XApiEx.Model.Media.t()] | nil,
          :places => [XApiEx.Model.Place.t()] | nil,
          :polls => [XApiEx.Model.Poll.t()] | nil,
          :topics => [XApiEx.Model.SpaceTopic.t()] | nil,
          :tweets => [XApiEx.Model.Post.t()] | nil,
          :users => [XApiEx.Model.User.t()] | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:media, :list, XApiEx.Model.Media)
    |> Deserializer.deserialize(:places, :list, XApiEx.Model.Place)
    |> Deserializer.deserialize(:polls, :list, XApiEx.Model.Poll)
    |> Deserializer.deserialize(:topics, :list, XApiEx.Model.SpaceTopic)
    |> Deserializer.deserialize(:tweets, :list, XApiEx.Model.Post)
    |> Deserializer.deserialize(:users, :list, XApiEx.Model.User)
  end
end
