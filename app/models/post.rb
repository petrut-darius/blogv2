class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end
