class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :content, :banner_image

  def banner_image
    rails_blob_path(object.banner_image, only_path: true) if object.banner_image.attached?
  end
end
