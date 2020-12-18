class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :replies

    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true
    validates :password,
              length: { minimum: 8 },
              if: -> { new_record? || !password.nil? }

  end