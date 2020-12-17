json.array! @posts do |post|
    json.id post.id
    json.name post.name
    json.content post.content
    # json.banner_image post.banner_image
    json.views post.views
    json.tags post.tags do |tag|
        json.id tag.id
        json.name tag.name
    end
end