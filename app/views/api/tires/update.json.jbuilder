json.tire do
    json.name @tire.name
    json.width @tire.width
    json.height @tire.height
    json.inch @tire.inch
    json.season @tire.season
    json.price @tire.price
    json.list_price @tire.list_price
    json.stock @tire.stock
    json.description @tire.description
    json.sku @tire.sku
    if((defined? @tire.tire_image) && (@tire.tire_image.filename != nil))
        json.tire_image rails_blob_url(@tire.tire_image)
    end
    json.brand @tire.brand
end

json.message @message
json.success true