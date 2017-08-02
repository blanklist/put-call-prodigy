class User < ApplicationRecord
  has_secure_password
  has_one :robot
	has_many :contracts

  before_save :assign_robot
  before_save :fund_bank

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username

  accepts_nested_attributes_for :robot, allow_destroy: true

  def assign_robot
    self.robot_attributes = { name: "YOLO" }
  end

  def fund_bank
    self.bank = 500.00
  end

  def logged_in?
    !!current_user
  end

  def self.verify_user(params)
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      @user
    else
      nil
    end
  end

  def calculate_bank
    self.bank = current_user.contracts.sum(:gain_loss)
  end
end
