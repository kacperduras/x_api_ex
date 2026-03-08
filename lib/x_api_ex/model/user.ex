defmodule XApiEx.Model.User do
  @moduledoc """
  A user object representing an X (Twitter) account.
  """

  @derive JSON.Encoder
  defstruct [
    :created_at,
    :description,
    :entities,
    :id,
    :location,
    :name,
    :pinned_tweet_id,
    :profile_image_url,
    :protected,
    :url,
    :username,
    :verified,
    :withheld
  ]

  @type t :: %__MODULE__{
          :created_at => String.t() | nil,
          :description => String.t() | nil,
          :entities => XApiEx.Model.User.Entities.t() | nil,
          :id => String.t() | nil,
          :location => String.t() | nil,
          :name => String.t() | nil,
          :pinned_tweet_id => String.t() | nil,
          :profile_image_url => String.t() | nil,
          :protected => boolean() | nil,
          :url => String.t() | nil,
          :username => String.t() | nil,
          :verified => boolean() | nil,
          :withheld => term() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:entities, :struct, XApiEx.Model.User.Entities)
  end
end
