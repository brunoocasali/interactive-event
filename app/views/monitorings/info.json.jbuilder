json.extract! @item, :id, :service, :text

json.image do
  json.url @item.image_url(:big)
end

json.author do
  json.avatar @item.author.avatar_url(:big_screen)
end
