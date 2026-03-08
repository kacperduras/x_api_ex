defmodule XApiEx.Model.Media do
  @moduledoc """
  A media object attached to a post.
  """

  @derive JSON.Encoder
  defstruct [
    :duration_ms,
    :height,
    :media_key,
    :preview_image_url,
    :public_metrics,
    :type,
    :url,
    :width
  ]

  @type t :: %__MODULE__{
          :duration_ms => number() | nil,
          :height => number() | nil,
          :media_key => String.t() | nil,
          :preview_image_url => String.t() | nil,
          :public_metrics => XApiEx.Model.Media.PublicMetrics.t() | nil,
          :type => String.t() | nil,
          :url => String.t() | nil,
          :width => number() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:public_metrics, :struct, XApiEx.Model.Media.PublicMetrics)
  end
end
