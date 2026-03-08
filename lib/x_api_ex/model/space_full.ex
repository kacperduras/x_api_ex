defmodule XApiEx.Model.SpaceFull do
  @moduledoc """
  A full Space object with all available fields.
  """

  @derive JSON.Encoder
  defstruct [
    :created_at,
    :creator_id,
    :ended_at,
    :host_ids,
    :id,
    :invited_user_ids,
    :is_ticketed,
    :lang,
    :participant_count,
    :scheduled_start,
    :speaker_ids,
    :started_at,
    :state,
    :subscriber_count,
    :title,
    :topics,
    :updated_at
  ]

  @type t :: %__MODULE__{
          :created_at => String.t() | nil,
          :creator_id => String.t() | nil,
          :ended_at => String.t() | nil,
          :host_ids => [String.t()] | nil,
          :id => String.t() | nil,
          :invited_user_ids => [String.t()] | nil,
          :is_ticketed => String.t() | nil,
          :lang => String.t() | nil,
          :participant_count => number() | nil,
          :scheduled_start => String.t() | nil,
          :speaker_ids => [String.t()] | nil,
          :started_at => String.t() | nil,
          :state => String.t() | nil,
          :subscriber_count => number() | nil,
          :title => String.t() | nil,
          :topics => [XApiEx.Model.SpaceTopic.t()] | nil,
          :updated_at => String.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(:topics, :list, XApiEx.Model.SpaceTopic)
  end
end
