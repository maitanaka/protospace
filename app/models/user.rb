class User < ActiveRecord::Base
  has_many :prototypes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :nickname

  mount_uploader :avatar, AvatarUploader

end
