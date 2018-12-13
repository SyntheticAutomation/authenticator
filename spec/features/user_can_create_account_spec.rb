require 'rails_helper'

describe 'a visitor to our web app' do
  it 'can create an account' do

    visit '/'

    click_link "Sign up for an account"

    expect(current_path).to eq(new_user_path)

    name = "AskYoGirlAboutMe"
    email = "chrishansen@gmail.com"
    password = "password"

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password

    click_on "Create User"

    expect(current_path).to eq(user_path("#{Book.last.id}"))
  end
end
