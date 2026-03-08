defmodule XApiEx.Model.MediaMetadata do
  @moduledoc """
  Media metadata object (used in both request and response).
  """

  @derive JSON.Encoder
  defstruct [
    :allow_download_status,
    :alt_text,
    :audience_policy,
    :content_expiration,
    :domain_restrictions,
    :found_media_origin,
    :geo_restrictions,
    :management_info,
    :preview_image,
    :sensitive_media_warning,
    :shared_info,
    :sticker_info,
    :upload_source
  ]

  @type t :: %__MODULE__{
          :allow_download_status => XApiEx.Model.MediaMetadata.AllowDownloadStatus.t() | nil,
          :alt_text => XApiEx.Model.MediaMetadata.AltText.t() | nil,
          :audience_policy => XApiEx.Model.MediaMetadata.AudiencePolicy.t() | nil,
          :content_expiration => XApiEx.Model.MediaMetadata.ContentExpiration.t() | nil,
          :domain_restrictions => XApiEx.Model.MediaMetadata.DomainRestrictions.t() | nil,
          :found_media_origin => XApiEx.Model.MediaMetadata.FoundMediaOrigin.t() | nil,
          :geo_restrictions => XApiEx.Model.MediaMetadata.GeoRestrictions.t() | nil,
          :management_info => XApiEx.Model.MediaMetadata.ManagementInfo.t() | nil,
          :preview_image => XApiEx.Model.MediaMetadata.PreviewImage.t() | nil,
          :sensitive_media_warning => XApiEx.Model.MediaMetadata.SensitiveMediaWarning.t() | nil,
          :shared_info => XApiEx.Model.MediaMetadata.SharedInfo.t() | nil,
          :sticker_info => XApiEx.Model.MediaMetadata.StickerInfo.t() | nil,
          :upload_source => XApiEx.Model.MediaMetadata.UploadSource.t() | nil
        }

  alias XApiEx.Deserializer

  @doc "Deserializes nested structs within the given map into their respective model types."
  @spec decode(map()) :: t()
  def decode(value) do
    value
    |> Deserializer.deserialize(
      :allow_download_status,
      :struct,
      XApiEx.Model.MediaMetadata.AllowDownloadStatus
    )
    |> Deserializer.deserialize(:alt_text, :struct, XApiEx.Model.MediaMetadata.AltText)
    |> Deserializer.deserialize(
      :audience_policy,
      :struct,
      XApiEx.Model.MediaMetadata.AudiencePolicy
    )
    |> Deserializer.deserialize(
      :content_expiration,
      :struct,
      XApiEx.Model.MediaMetadata.ContentExpiration
    )
    |> Deserializer.deserialize(
      :domain_restrictions,
      :struct,
      XApiEx.Model.MediaMetadata.DomainRestrictions
    )
    |> Deserializer.deserialize(
      :found_media_origin,
      :struct,
      XApiEx.Model.MediaMetadata.FoundMediaOrigin
    )
    |> Deserializer.deserialize(
      :geo_restrictions,
      :struct,
      XApiEx.Model.MediaMetadata.GeoRestrictions
    )
    |> Deserializer.deserialize(
      :management_info,
      :struct,
      XApiEx.Model.MediaMetadata.ManagementInfo
    )
    |> Deserializer.deserialize(:preview_image, :struct, XApiEx.Model.MediaMetadata.PreviewImage)
    |> Deserializer.deserialize(
      :sensitive_media_warning,
      :struct,
      XApiEx.Model.MediaMetadata.SensitiveMediaWarning
    )
    |> Deserializer.deserialize(:shared_info, :struct, XApiEx.Model.MediaMetadata.SharedInfo)
    |> Deserializer.deserialize(:sticker_info, :struct, XApiEx.Model.MediaMetadata.StickerInfo)
    |> Deserializer.deserialize(:upload_source, :struct, XApiEx.Model.MediaMetadata.UploadSource)
  end
end
