class StepPahth < ActiveRecord::Base
  attr_accessible :p_step_id, :pahth_id, :times_taken

  belongs_to :pahth
  belongs_to :p_step

  validates :pahth_id, presence: true
  validates :p_step_id, presence: true

end
