require 'uri'

class User < ApplicationRecord
  has_many :accesses, class_name: 'Access'

  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, :uuid, uniqueness: true
end
