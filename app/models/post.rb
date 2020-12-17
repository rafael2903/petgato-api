class Post < ApplicationRecord

    has_one_attached :image
    has_many :post_has_tags
    has_many :comments
    has_many :tags, through: :post_has_tags

end
