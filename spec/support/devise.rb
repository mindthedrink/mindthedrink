RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Warden::Test::Helpers
  Warden.test_mode!
end

def login_admin
  login FactoryGirl.create(:admin_user)
end

def login(user)
  login_as user, scope: :user
  #page.driver.post user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
end

def logout_user
  logout :user
  #page.driver.delete destroy_user_session_path
end