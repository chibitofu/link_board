class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  validates :email,
  presence: true,
  email: true,
  uniqueness: {case_sensitive: false}

  validates :name,
  presence: true,
  length: { maximum: 19 }

  validates_presence_of :password, on: :create

  has_secure_password

  has_many :post
  has_many :comment

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
