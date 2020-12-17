class Tag < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    # has_many :posts, through: :post_has_tags

    has_many :post_has_tags
    # has_and_belongs_to_many :post
end
