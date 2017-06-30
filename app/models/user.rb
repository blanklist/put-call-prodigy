class User < ApplicationRecord
  has_secure_password

	has_many :contracts


  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username


  def self.verify_user(params)
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      @user
    else
      nil
    end
  end

end
