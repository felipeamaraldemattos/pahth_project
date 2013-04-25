class Pahth < ActiveRecord::Base
  attr_accessible :title, :description, :pahth_tipo, :content

  belongs_to :user

  has_many :step_pahths, dependent: :destroy
  has_many :p_steps, :through => :step_pahths


  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :pahth_tipo, presence: true, length: { maximum: 20 }
  validates :content, length: { maximum: 1000 }

  default_scope order: 'pahths.created_at DESC'


end
