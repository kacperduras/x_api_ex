defmodule XApiEx.Model.Post.Entities.Url do
  @moduledoc """
  A URL entity within a post.
  """

  @derive JSON.Encoder
  defstruct [
    :description,
    :display_url,
    :end,
    :expanded_url,
    :images,
    :start,
    :status,
    :title,
    :unwound_url,
    :url
  ]

  @type t :: %__MODULE__{
          :description => String.t() | nil,
          :display_url => String.t() | nil,
          :end => number() | nil,
          :expanded_url => String.t() | nil,
          :images => [XApiEx.Model.Post.Entities.UrlImage.t()] | nil,
          :start => number() | nil,
          :status => number() | nil,
          :title => String.t() | nil,
          :unwound_url => String.t() | nil,
          :url => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:images, :list, XApiEx.Model.Post.Entities.UrlImage)
  end
end
