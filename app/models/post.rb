class Post < ApplicationRecord
    #include Rails.application.routes.url_helpers

    has_rich_text :content
    has_many :post_has_tags
    has_many :comments
    has_many :tags, through: :post_has_tags
    has_one_attached :banner_image
    
    # attributes :banner_image
    
    #def banner_image
    #    rails_blob_path(object.banner_image, only_path: true) if object.banner_image.attached?
    #end
end
