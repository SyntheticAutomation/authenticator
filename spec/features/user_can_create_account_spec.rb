require 'rails_helper'

describe 'a visitor to our web app' do
  it 'can create an account' do
    
    visit '/'

    click_link "Create User"

    expect(current_path).to eq(new_user)
  end
end
