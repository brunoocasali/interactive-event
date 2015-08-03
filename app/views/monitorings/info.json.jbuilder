json.extract! @item, :id, :service

json.set! :text, truncate(@item.text, length: 200)

json.image do
  json.url @item.image_url(:big)
end

json.author do
  json.avatar @item.author.avatar_url(:big_screen)
end
