class User < ApplicationRecord
    has_many :user_tasks
    has_many :tasks, through: :user_tasks
    has_secure_password

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :user_name, presence: true, length: { minimum: 3 }
end
