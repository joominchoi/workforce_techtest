class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email_address
  validates_uniqueness_of :email_address
  validates :password, length: { minimum: 6 }, :on => :create
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }
  
end