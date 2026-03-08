defmodule XApiEx.Model.ComplianceJob do
  @moduledoc """
  A batch compliance job object.
  """

  @derive JSON.Encoder
  defstruct [
    :created_at,
    :download_expires_at,
    :download_url,
    :id,
    :name,
    :resumable,
    :status,
    :type,
    :upload_expires_at,
    :upload_url
  ]

  @type t :: %__MODULE__{
          :created_at => String.t() | nil,
          :download_expires_at => String.t() | nil,
          :download_url => String.t() | nil,
          :id => String.t() | nil,
          :name => String.t() | nil,
          :resumable => boolean() | nil,
          :status => String.t() | nil,
          :type => String.t() | nil,
          :upload_expires_at => String.t() | nil,
          :upload_url => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
