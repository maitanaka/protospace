class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images

  validates :name, presence: true

end
