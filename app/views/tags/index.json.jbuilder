json.array! @tags do |tag|
    json.id tag.id
    json.name tag.name 
    json.description tag.description
    json.posts_size tag.posts.size 
end