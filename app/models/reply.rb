class Reply < ApplicationRecord
    has_many :comment_has_replies
    belongs_to :comment
    belongs_to :user
end
