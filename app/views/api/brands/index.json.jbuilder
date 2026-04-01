json.brands @brands.each do |brand|
    json.id brand.id
    json.name brand.name
end