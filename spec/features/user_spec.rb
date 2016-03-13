require 'rails_helper'

describe "User test" do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "sign in user" do
    visit("/users/sign_in")

    within ".new_user" do
      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => @user.password
    end
    click_button "Sign in"

    expect(page).to have_content("My Profile")
  end

end