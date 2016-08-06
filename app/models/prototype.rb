class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :reject_image

  validates_presence_of :name, :catchcopy, :concept

  scope :likes_desc, -> {order('like_count desc')}

  def reject_image(attributed)
    attributed['image_url'].blank?
  end

  def date
    created_at.strftime('%b %d')
  end

  def get_main_img
    images.main.first.image_url
  end

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end


end
