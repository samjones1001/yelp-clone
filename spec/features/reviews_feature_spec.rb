require 'rails_helper'

feature 'reviewing' do
  before do
    user = User.create(email: 'email@email.com', password: 'password')
    Restaurant.create(name: 'KFC', user_id: user.id)
  end



  scenario 'allows user to leave a review' do
    visit '/'

   click_link('Sign in')

   fill_in('Email', with: 'email@email.com')

   fill_in('Password', with: 'password')

   click_button("Log in")

    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end
end
