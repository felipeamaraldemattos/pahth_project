class PStep < ActiveRecord::Base
  attr_accessible :category_knowledge, :content, :type_learning, :title

  belongs_to :user

  has_many :step_pahths, dependent: :destroy
  has_many :pahths, :through => :step_pahths


  validates :user_id, presence: true
  validates :category_knowledge, presence: true, length: { maximum: 20 }
  validates :type_learning, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: { maximum: 100  }

  default_scope order: 'p_steps.created_at DESC'


end
