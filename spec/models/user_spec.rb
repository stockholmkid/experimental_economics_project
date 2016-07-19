require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'

describe User do
  it { should have_valid(:studentid).when(123456, 123457) }
  it { should_not have_valid(:studentid).when(nil, '', 4) }

  it { should have_valid(:email).when("user@colorado.com", "another@example.com") }
  it { should_not have_valid(:email).when(nil, '') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
