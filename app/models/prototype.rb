class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, reject_if: lambda { |a| a[:image_url].blank? }, allow_destroy: true

  validates_presence_of :name, :catchcopy, :concept

  def date
    created_at.strftime('%b %d')
  end

  def get_main_img
    images.main.first.image_url
  end

end
