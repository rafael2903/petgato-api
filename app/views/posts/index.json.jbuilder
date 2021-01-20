json.array! @posts do |post|
    json.id post.id
    json.name post.name
    json.created_at post.created_at
    json.content post.content
    json.image url_for(@post.banner_image)
    #json.banner_image url_for(post.banner_image)
    #json.views post.views
    json.tags post.tags do |tag|
        json.id tag.id
        json.name tag.name
    end
end