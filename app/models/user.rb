class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_many :pahths, dependent: :destroy
  has_many :p_steps, dependent: :destroy

  accepts_nested_attributes_for :pahths, :p_steps

  acts_as_authentic


  before_save { |user| user.email = email.downcase }


  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  # paths suggested to user in home page
  def pahths_feed
    # temporary future should have smart way of suggesting pahths for user
    Pahth.all
  end

  # steps suggested to user in home page
  def p_steps_feed
    PStep.all
  end

  # steps user is signed to complete
  def to_dos_feed
    self.reload
    self.p_steps
  end

  # user collection of steps created by user
  def p_steps_user
    self.reload
    self.p_steps
  end

  # user collection of paths created by user
  def pahths_user
    self.reload
    self.pahths
  end

end