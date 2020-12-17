class User < ApplicationRecord

    before_save :set_admin
    has_secure_password

    # mount_uploader :avatar, AvatarUploader
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }

    def set_admin
        self.is_admin = true
    end


  end