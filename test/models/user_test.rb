require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a new User needs an email to be saved" do
    user = User.new(email: 'example@test.com')
    assert user.save, "saved the article"
  end


end

