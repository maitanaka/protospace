class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :reject_image_url

  validates_presence_of :name, :catchcopy, :concept

  def reject_image_url(attributed)
    attributed['image_url'].blank?
  end

  def date
    created_at.strftime('%b %d')
  end

  def get_main_img
    images.main.first.image_url
  end

end
