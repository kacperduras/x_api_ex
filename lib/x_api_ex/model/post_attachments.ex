defmodule XApiEx.Model.Post.Attachments do
  @moduledoc """
  Attachments on a post (media keys, poll IDs).
  """

  @derive JSON.Encoder
  defstruct [
    :media_keys,
    :poll_ids
  ]

  @type t :: %__MODULE__{
          :media_keys => [String.t()] | nil,
          :poll_ids => [String.t()] | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
