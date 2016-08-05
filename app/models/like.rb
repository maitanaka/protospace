class Like < ActiveRecord::Base
  belongs_to :prototype, counter_cache: :like_count
  belongs_to :user

end
