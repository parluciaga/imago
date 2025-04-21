class Image < ApplicationRecord
  has_one_attached :picture
  has_many :comments, dependent: :destroy

  validates :picture, presence: true
  validates :name, presence: true
end
