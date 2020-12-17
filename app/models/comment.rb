class Comment < ApplicationRecord
    has_many :comment_has_replies
    has_many :replies
    belongs_to :user
    belongs_to :post
end
