class Pahth < ActiveRecord::Base
  attr_accessible :title, :description, :pahth_tipo, :content
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :pahth_tipo, presence: true, length: { maximum: 20 }
  validates :content, length: { maximum: 1000 }


end
