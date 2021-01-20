json.id @post.id
json.created_at @post.created_at
json.name @post.name 
json.content @post.content
json.image @post.banner_image
json.tags @post.tags do |tag|
    json.id tag.id
    json.name tag.name
end