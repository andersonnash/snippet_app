require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'is valid with email and password' do
    expect(@user).to be_valid
  end
end