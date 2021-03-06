class Image < ActiveRecord::Base
  belongs_to :prototype

  enum status: [:main, :sub]

  mount_uploader :image_url, ImageUploader

  validates :image_url, :status, presence: true
end
