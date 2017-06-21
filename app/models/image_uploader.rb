class ImageUploader < Shrine
  plugin :cached_attachment_data
  plugin :determine_mime_type

  Attacher.validate do
    validate_max_size 2.megabyte, message: "Arquivo muito grande (maximo 2 MB)"
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png']
  end
end
