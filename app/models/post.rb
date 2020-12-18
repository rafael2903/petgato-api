class Post < ApplicationRecord
    has_one_attached :banner_image
    has_rich_text :content
    has_many :post_has_tags
    has_many :comments
    has_many :tags, through: :post_has_tags
end
