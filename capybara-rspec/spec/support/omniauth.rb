# https://github.com/intridea/omniauth/wiki/Integration-Testing
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  :provider => 'facebook',
  :uid => '1850846653',
  :info => {
    :email => 'testuser@gmail.com'
  },
  :credentials => {
    :token => 'newfbtoken',
    :expires_at => 2.hours.from_now.to_i
  },
  :extra => {
    :raw_info => {
      :id => '1850846653',
      :name => 'Test User',
      :first_name => 'Test',
      :last_name => 'User',
      :username => 'testuser',
      :location => {
        :id => '103720949666092',
        :name => 'Phnom Penh'
      },
      :gender => 'male',
      :email => 'testuser@gmail.com'
    }
  }
})

OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
  :provider => 'google',
  :uid => '531564247',
  :info => {
    :email => 'testuser@gmail.com'
  },
  :credentials => {
    :token => 'newggtoken',
    :expires_at => 1.hours.from_now.to_i
  },
  :extra => {
    :raw_info => {
      :id => '531564247',
      :email => 'testuser@gmail.com',
      :verified_email => true,
      :name => 'Test User',
      :given_name => 'Test',
      :family_name => 'User',
      :gender => 'male'
    }
  }
})