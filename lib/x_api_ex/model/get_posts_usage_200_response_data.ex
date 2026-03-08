defmodule XApiEx.Model.GetPostsUsage200ResponseData do
  @moduledoc """
  Inner data payload of the get-posts-usage response, detailing API cap and consumption for the project.

  Fields:
  - `cap_reset_day` - day of the month on which the usage cap resets.
  - `project_cap` - total monthly post read cap granted to the project.
  - `project_id` - unique identifier of the X developer project.
  - `project_usage` - number of post reads consumed so far in the current cap period.
  """

  @derive JSON.Encoder
  defstruct [
    :cap_reset_day,
    :project_cap,
    :project_id,
    :project_usage
  ]

  @type t :: %__MODULE__{
          :cap_reset_day => number() | nil,
          :project_cap => String.t() | nil,
          :project_id => String.t() | nil,
          :project_usage => String.t() | nil
        }

  @doc "Returns the value unchanged; this model has no nested structs to deserialize."
  @spec decode(map()) :: t()
  def decode(value) do
    value
  end
end
