class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_many :pahths, dependent: :destroy

  accepts_nested_attributes_for :pahths

  acts_as_authentic


  before_save { |user| user.email = email.downcase }


  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  def pahths_feed
    # temporary future should have smart way of suggesting pahths for user
    Pahth.all
  end






end