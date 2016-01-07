class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comment

  validates :title,
  presence: true,
  length: { in: 2...100}

  validates :link,
  presence: true,
  format: URI::regexp(%w(http https))
end
