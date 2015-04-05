require 'rails_helper'

describe User do

  before :each do
    @user = create(:user)
  end

  it { should respond_to(:email) }
  it { should respond_to(:name) }
end