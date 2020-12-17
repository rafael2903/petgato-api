class User < ApplicationRecord

    before_save :set_admin
    has_secure_password
    has_many :comments
    has_many :replies

    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true
    validates :password,
              length: { minimum: 8 },
              if: -> { new_record? || !password.nil? }

    def set_admin
        self.is_admin = true
    end


  end