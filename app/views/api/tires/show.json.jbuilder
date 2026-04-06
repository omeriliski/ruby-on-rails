entity = @tire || @entity

json.tire do
    json.id entity.id
    json.name entity.name
    json.width entity.width
    json.height entity.height
    json.inch entity.inch
    json.season entity.season
    json.price entity.price
    json.list_price entity.list_price
    json.stock entity.stock
    json.description entity.description
    json.sku entity.sku
    if ((defined? entity.tire_image) && (entity.tire_image.filename != nil))
        json.tire_image rails_blob_url(entity.tire_image)
    end
    json.brand entity.brand
end

json.message(@message.presence || (@entity.present? ? "from cache" : "from db"))
json.success true