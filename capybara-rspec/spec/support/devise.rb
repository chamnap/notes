# http://schneems.com/post/15948562424/speed-up-capybara-tests-with-devise

# gives us the login_as(@user) method when request object is not present
include Warden::Test::Helpers
Warden.test_mode!

# Will run the given code as the user passed in
def as_user(user=nil, &block)
  current_user = user || FactoryGirl.create(:user)
  if request.present?
    sign_in(current_user)
  else
    login_as(current_user, :scope => :user, :run_callbacks => false)
  end
  block.call if block.present?
  return self
end

def as_visitor(user=nil, &block)
  current_user = user || FactoryGirl.stub(:user)
  if request.present?
    sign_out(current_user)
  else
    logout(:user)
  end
  block.call if block.present?
  return self
end